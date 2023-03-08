<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : catch</title>
</head>

<body>
	
	<h2>JSTL c: catch</h2>
	<hr />
	
	<c:catch var="errMsg">
 	<%= 10 / 0 %>
	</c:catch>

	error Message: ${errMsg }
	

</body>
</html>