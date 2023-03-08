<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : if</title>
</head>

<body>
	
	<h2>JSTL c: if</h2>
	<hr />
	
	<c:set var="msg" value="user1" />
	msg: ${msg}
	<hr />
	
	<c:if test="${mgs == 'user1'}" var="result"/>
	result : ${result }
	<hr />
	<c:if test="${mgs == 'user1'}" var="result">
	test result : ${result }
	</c:if>
	<hr />
	<c:if test="${mgs == 'user2'}" var="result">
	test result : ${result }
	</c:if>
	
	result: ${result}
</body>
</html>