<%@ page  contentType="text/html; charset=UTF-8"	
		  import="mvc.twitter.*"
%>

<jsp:useBean id="twitterDAO" class="mvc.twitter.TwitterDAO" scope="page" />
<jsp:useBean id="loginDO" class="mvc.twitter.TwitterLoginDO" scope="page"/>
<jsp:setProperty name="loginDO" property="*" />

<%
	if(request.getMethod().equals("POST")){
		TwitterLoginDO result = twitterDAO.checkLogin(loginDO);
		if(result != null) { 			//--> null이 아닐때 (로그인에 성공 했을떄)
			session.setAttribute("id",result.getId());
			session.setAttribute("name",result.getName());
			
			response.sendRedirect("twitterList.jsp");
		}
	}


%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>twitterLogin.jsp</title>
</head>

<body>

	<h2>트위터 로그인</h2>
		<hr />
	
		<form method="POST">
		<fieldset> 
			<legend>로그인</legend>
			<label for="id">ID</label>
			<input type = "text" name="id" id="id" />
			<label for="passwd">Passwd</label>
			<input type = "password" name="passwd" id="passwd" />
			<input type="submit" value="login" />
		</fieldset>
		</form>


</body>
</html>