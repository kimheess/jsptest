<%@ page contentType="text/html; charset=UTF-8" 
		 import="chap12.*"
%>

<!-- DBCP를 이용하는 Model 을 사용하여 기능을 구현하는 코드를 작성하세요. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id="dao" class="chap12.JdbcTestDAO" />
<jsp:useBean id="testDO" class="chap12.JdbcTestDO" />
<jsp:setProperty name="tdo" property="*" />

<%
	if(request.getMethod().equals("POST")) {
		dao.insertJdbcTest(testDO);
	}
%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc_test2.jsp</title>
</head>

<body>

	<h1>JDBC Test v2 ::: DBCP</h1>
	<hr />
	
	<form method="POST">
	<fieldset>
		<legend>정보 등록</legend>
		<label for="username">이름</label>
		<input type="text" name="username" id="username" /> /
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" />
		<input type="submit" value="등록" />
	</fieldset>
	</form>
	
	<hr />
	
	<h3>등록 목록</h3>
	
	<ol>		
	<c:forEach items="${dao.selectAllJdbcTest()}" var="tdo">
		<li>${tdo.username} | ${tdo.email}</li>
	</c:forEach>
	</ol>

</body>
</html>