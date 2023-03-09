<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : redirect</title>
</head>

<body>
	
	<h2>JSTL c: redirect</h2>
	<hr />
	
	<c:redirect url="/chap11/choose.jsp">
		<c:param name="sel">c</c:param>
	</c:redirect>
	

</body>
</html>