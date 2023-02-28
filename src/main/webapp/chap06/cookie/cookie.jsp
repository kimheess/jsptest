<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	Cookie cookie = new Cookie("product","p1234");
	response.addCookie(cookie);
%>

<html>
<head>
   <meta charset="UTF-8">
   <title>cookie.jsp</title>
</head>

<body>

	<h1>Cookie Example</h1>
	<hr />
	
	<h4>브라우저의 개발자 도구를 이용해 저장된 쿠키를 확인하세요.</h4>
	
</body>
</html>