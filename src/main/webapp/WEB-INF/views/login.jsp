<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	테스트 접속정보
	ID : test
	PW : 1234

 	<form action="/login-processing"  method="post" >
	   <div>
	    Id: <input type="text" id = "email" name = "email" />
	  </div>
	  <div>
	    Password: <input type="password" id = "password" name = "password" />
	  </div> 
	  <div>
	    <input type="submit" value="Log in" />
	  </div>
	  <!-- csrf token 자동생성 -->
	  <input  type = "hidden" name = "${_csrf.parameterName}"  value = "${_csrf.token}" />
	  <!--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>-->
	</form> 

</body>
</html>