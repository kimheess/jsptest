<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	String name = "longlee";
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css" />
</head>
<body>

	
	<%@ include file="header.jsp" %>
	
	<div id="contents">
		<%@ include file="left.jsp" %>
		<%@ include file="right.jsp" %>
	</div>

	<%@ include file="footer.jsp" %>
	
</body>
</html>