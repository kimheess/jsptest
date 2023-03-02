<%@ page  contentType="text/html; charset=UTF-8"
		  import="chap08.*, java.util.*"
%>
<%
if(request.getMethod().equals("POST")){
	request.setCharacterEncoding("UTF-8");
}
%>

<jsp:useBean id="dao" class="chap08.JdbcTestDAO" scope="session" />
<jsp:useBean id="testDO" class="chap08.JdbcTestDO" scope="page" />
<jsp:setProperty name="testDO" property="*" />

<%
	if(request.getMethod().equals("POST")){
		
		dao.insertJdbcTest(testDO);
	}

	ArrayList<JdbcTestDO> list = dao.selectAllJdbcTest();
	String result = "";
	
	for(JdbcTestDO tdo : list){
		result += "<li>" + tdo.getUsername() + " | " + tdo.getEmail() + "</li>";
	}
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>jdbc_test2.jsp</title>
</head>

<body>
	
	<h1>JDBC Test V2</h1>
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
		<%= result %>
	</ol>
</body>
</html>