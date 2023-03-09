<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>initParam.jsp</title>
</head>

<body>
	
	<h2>초기화 파라미터 예제</h2>
	<hr />
	
	userName: <%= config.getInitParameter("userName") %> <br/>
	AdminID: <%= application.getInitParameter("adminID") %><br/>
	AdminPasswd: <%= application.getInitParameter("adminPasswd") %><br/>


</body>
</html>