<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap11.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>JSTL : import</title>
</head>

<body>
	
	<h2>JSTL c: import</h2>
	<hr />
	
	<h3>다음은 set.jsp를 import 한 결과 입니다.</h3>
	<hr />
	
	<c:import url="set.jsp" var="resultSet" />
	<c:out value="${resultSet}" escapeXml="false" />
	
	<h3>다음은 chap10/el/productList.jsp를 import 한 결과 입니다.</h3>
	<hr />
	
	<c:import url="/chap10/el/productList.jsp" var="resultPorductList" />
	<c:out value="${resultPorductList}" escapeXml="false" />

</body>
</html>