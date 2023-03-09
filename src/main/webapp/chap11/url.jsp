<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : url</title>
</head>

<body>
	
	<h2>JSTL c: url</h2>
	<hr />
	
	<c:url value="/chap11/choose.jsp" var="target">
		<c:param name="sel">a</c:param>
	</c:url>
	
	단순 출력: ${target} <br />
	링크 연동: <a href=${target}">choose.jsp 이동</a>

</body>
</html>