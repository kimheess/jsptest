<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : set</title>
</head>

<body>
	
	<h2>JSTL c:set</h2>
	<hr />
	
<!-- 	<c:set var="msg" value="Hello, World!"/>
	msg: ${msg}<br />
	msg: <%= pageContext.getAttribute("msg") %>
	
	<hr />
	
	<c:set target="${member}" property="email" value="changed@nate.com"/>
	Member name: ${member.name } <br />
	Member email: ${member.email }  -->
	
	<%
		Member member = (Member)application.getAttribute("member");
	%>
	
	Member name: <%= member.getName() %> <br/>
	Member name: <%= member.getEmail() %>
	

</body>
</html>