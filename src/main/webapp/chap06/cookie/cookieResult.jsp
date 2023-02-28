<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	Cookie []  cookies = request.getCookies();
	String result = "";
	
	for(Cookie cookie : cookies){
		result += "<h4>name: " + cookie.getName() + " / value: " + cookie.getValue() + "</h4>";
	}
	
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>cookieResult.jsp</title>
</head>

<body>

	<h1>쿠키 확인</h1>
	<hr />
	

	
	<%= result %>
	
	

</body>
</html>