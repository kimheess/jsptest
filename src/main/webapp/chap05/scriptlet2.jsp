<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>scriptlet2.jsp</title>
</head>

<body>

<%
	for(int i = 0; i< 10; i++){
		
	
%>
	<h4><%= i + "." %>Hello, World ... !</h4>
<%
	}
%>

</body>
</html>