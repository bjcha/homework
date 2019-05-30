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
  <title>스마트팩토리</title>

  <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">

</head>

<body>
	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
  
 
    <!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <!-- Custom scripts for this page-->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    
    <script>
    /*체크박스 검사*/
    	function btnTest(){
    		 // Iterate over all checkboxes in the table
    		   table.$('input[type="checkbox"]').each(function(){
    		   /*    // If checkbox doesn't exist in DOM
    		      if(!$.contains(document, this)){
    		         // If checkbox is checked
    		         if(this.checked){
    		            // Create a hidden element
    		            $(form).append(
    		               $('<input>')
    		                  .attr('type', 'hidden')
    		                  .attr('name', this.name)
    		                  .val(this.value)
    		            );
    		         }
    		      } */
    		      alert(this.checked);
    		   });
    	}
	    $(document).ready(function() {
	    	datatableStart();
	    } );
	    function datatableStart(){
	    	var url = '/manager/dvManager.do';

	    	table = $('#ex').DataTable({
	    		"processing": false,
	    	    "serverSide": false,
	    	    "pagingType": "full_numbers",
	    	    "searching": false,
	    	    "ordering": false,
	    	    "info":     false,
	    	    "bLengthChange": false,
	    	    "ajax": {
	    	    	"type": 'POST',
	    	        "url": url,
	    		    
	    			"dataSrc": function ( json ) {
	    			   //   alert(json.data);
	    				     
	    		    	 
	    			             return json.data;
	    			   }
	    		 },
	    		 
	    	     "columns":[
							{"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	                {"data" : "fnm"},
	    	     ],

	    	     'columnDefs': [{
	    	         'targets': 0,
	    	         'searchable': false,
	    	         'orderable': false,
	    	         'className': 'dt-body-center',
	    	         'render': function (data, type, full, meta){
	    	             return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
	    	         }
	    	      }],
	    	      'order': [[1, 'asc']]
	    	   
	    	});
	    }

    </script>
  </div>
</body>

</html>
