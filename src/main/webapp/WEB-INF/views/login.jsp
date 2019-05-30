<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

 	<form action="/login-processing"  method="post" >
	 <!--  <div>
	    Email: <input type="text" th:field="*{id}" autofocus />
	  </div>
	  <div>
	    Password: <input type="password" th:field="*{password}" />
	  </div> -->
	  <div>
	    <input type="submit" value="Log in" />
	  </div>
	  <!-- csrf token 자동생성 -->
	  <input  type = "hidden" name = "${_csrf.parameterName}"  value = "${_csrf.token}" />
	  <!--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>-->
	</form> 

</body>
</html>