<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>RSUPPORT 공지사항</title>

  <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


 <!-- Bootstrap core JavaScript
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   -->

 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<script>
$(function(){
	$("#date1").datepicker({dateFormat: 'yy-mm-dd'});
});
	


</script>

</head>
<body>
	<div id="write" style="display:none";>
		제목 : <input type="text" name="writeTitle" id="writeTitle" value="" />
		작성자 : <input type="text" name="writeName" id="writeName" value="" />
		내  용 : <textarea id="content"></textarea>
		<button id = "btn1" onclick="fnModify();" style="display:none";>수정</button>
		<button id = "btn2" onclick="fnWrite();" style="display:none";>등록</button>
		<button id = "btn3" onclick="fnSearch();" style="display:none";>목록</button>
	</div>

	<div id="list">
		<select name="select" id="select">
	  		<option value="title" >제목조회</option>
	  		<option value="name">작성자조회</option>
	  		<option value="regDate">등록일조회</option>
	  		<option value="modifyDate">수정일조회</option>
	  	</select>
	  	
	  	<input type="hidden" name="hiddenPath" id="hiddenPath" value="" />
	  	<input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
	  	<input type="text" name="value" id="value" value="" />
		<input type="text" name="date1" id="date1"	style="display:none"  />
	  
	  	<button onclick="fnSearch();">검색</button>
	  	<button onclick="writeView();">글쓰기</button>
	  	
	  	<table id="example" class="display" style="width:100%">
	  		<thead>
	  			<tr>
	  				<th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>수정일</th>
	                <th>보기</th>
	                <th>수정</th>
	                <th>삭제</th>
	                <th style="display:none";>content</th>
	            </tr>
	        </thead>
	    </table>
	</div>

</body>
 
  
<script type="text/javascript">
 
	$("#select").change(function() {
  		var value = $(this).val();
        if(value == 'title'){
       		$("#value").css('display', '');
       		$("#date1").css('display', 'none');
        }else if(value == "name"){
        	$("#value").css('display', '');
       		$("#date1").css('display', 'none');
        }else{
        	$("#value").css('display', 'none');
       		$("#date1").css('display', '');	
        	
        }
    });
 
 
    $(document).ready(function() {
 	//	$("#date1").datepicker({dateFormat: 'yy-mm-dd'});
    	datatableStart();
    }); 
     
    function datatableStart(){
    	url = '/rsupport/list';
    	table = $('#example').DataTable({
    		"processing": false,
    	    "serverSide": false,
    	    "pagingType": "full_numbers",
    	    "searching": false,
    	    "ordering": false,
    	    "info":     false,
    	    "bLengthChange": false,
    	    "iDisplayLength": 5,
    	    "ajax": {
    	    	"type": 'POST',
    	        "url": url,
    		    "data": function (d) {
    		    	d.value = $("#value").val();
    		    	d.select = $("#select").val();
    		    	d.date1 = $("#date1").val();
    		    	d.hiddenValue = $("#hiddenValue").val();
    		    	d.hiddenPath = $("#hiddenPath").val();
    		    	d.writeTitle = $("#writeTitle").val();
    		    	d.writeName = $("#writeName").val();
    		    	d.content = $("#content").val();
    			},
    			"dataSrc": function ( json ) {
    		    	$("#list").css('display', '');
    		    	$("#write").css('display', 'none');
    				return json.data;
    			}
    		 },
    	     "columns":[
    	                {"data" : "id"},
    	                {"data" : "title"},
    	                {"data" : "name"},
    	                {"data" : "regDate"},
    	                {"data" : "modifyDate"},
    	                {"data" : "id"},
    	                {"data" : "id"},
    	                {"data" : "id"},
    	                {"data" : "content"}
    	     ],
    	    fixedColumns: false,
    	    "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
    	    	var title = $(nRow).find('td:eq(1)').text();
    	    	var name = $(nRow).find('td:eq(2)').text();
    	    	var content = $(nRow).find('td:eq(8)').text();
    	    	var modNo = $(nRow).find('td:eq(0)').text();
    	    	
    	    	
    	    	$(nRow).find('td:eq(5)').text('');
    			$(nRow).find('td:eq(5)').append("<button onclick=view('" + title + "','" + name + "','" + content + "','" + modNo + "');>보기</button>");
    	    	
    	    	$(nRow).find('td:eq(6)').text('');
    			$(nRow).find('td:eq(6)').append("<button onclick=modifyView('" + title + "','" + name + "','" + content + "','" + modNo + "');>수정</button>");
    	    
    	    	$(nRow).find('td:eq(7)').text('');
    	    	$(nRow).find('td:eq(7)').append('<button onclick=fnDelete('+ modNo +');>삭제</button>');
    	    	
    	    	
    	    	$(nRow).find('td:eq(8)').css('display', 'none');
    	    }
    	});
    }
    
    function view(title,name,content,no){
    	
    	$("#hiddenPath").val("");
    	$("#hiddenValue").val("");
     	$("#writeTitle").val(title);
    	$("#writeName").val(name);
    	$("#content").val(content);
    	$("#hiddenValue").val(no);
    	
    	$("#writeTitle").attr("disabled",true);
    	$("#writeName").attr("disabled",true);
    	$("#content").attr("disabled",true);

    	$("#list").css('display', 'none');
    	$("#write").css('display', '');
    	$("#btn1").css('display', 'none');
    	$("#btn2").css('display', 'none');
    	$("#btn3").css('display', '');
    }
    
    function modifyView(title,name,content,no){

     	$("#writeTitle").val(title);
    	$("#writeName").val(name);
    	$("#content").val(content);
    	$("#hiddenValue").val(no);
    	

    	$("#writeTitle").attr("disabled",false);
    	$("#writeName").attr("disabled",false);
    	$("#content").attr("disabled",false);
    	$("#list").css('display', 'none');
    	$("#write").css('display', '');
    	$("#btn1").css('display', '');
    	$("#btn2").css('display', 'none');
    	$("#btn3").css('display', 'none');
    }
    
    function writeView(){
    	
    	
     	$("#list").css('display', 'none');
    	$("#write").css('display', '');
    	$("#btn2").css('display', '');
    	$("#btn1").css('display', 'none');
    	$("#btn3").css('display', 'none');
    	
    	$("#writeTitle").val("");
    	$("#writeName").val("");
    	$("#content").val("");
    	$("#hiddenValue").val("");
    	

    	$("#writeTitle").attr("disabled",false);
    	$("#writeName").attr("disabled",false);
    	$("#content").attr("disabled",false);
    	
    }
    
    function fnModify(){
    	if($("#writeTitle").val().replace(/\s/g,"").length == 0){
    		alert("제목을 입력하세요.");
    		return false;
    	}else if($("#writeName").val().replace(/\s/g,"").length == 0){
    		alert("작성자를 입력하세요.");
    		return false;
    	}else if($("#content").val().replace(/\s/g,"").length == 0){
    		alert("내용을 입력하세요.");
    		return false;
    	}
    	$("#hiddenPath").val("modify");
  		table.ajax.reload( function ( json ) {
  			return json.data;
    	});
    }
    
    function fnWrite(){
    	
    	if($("#writeTitle").val().replace(/\s/g,"").length == 0){
    		alert("제목을 입력하세요.");
    		return false;
    	}else if($("#writeName").val().replace(/\s/g,"").length == 0){
    		alert("작성자를 입력하세요.");
    		return false;
    	}else if($("#content").val().replace(/\s/g,"").length == 0){
    		alert("내용을 입력하세요.");
    		return false;
    	}
    	$("#hiddenPath").val("write");
  		table.ajax.reload( function ( json ) {
  			return json.data;
    	});
    }
    
    function fnDelete(no){
    	$("#hiddenPath").val("delete");
  		table.ajax.reload( function ( json ) {
  			return json.data;
    	});
    }
    
  	//검색 
    function fnSearch(){
    	$("#hiddenPath").val("");
    	$("#hiddenValue").val("");
  		table.ajax.reload( function ( json ) {
  			return json.data;
    	});
    }
  	
  
</script>


</html>
