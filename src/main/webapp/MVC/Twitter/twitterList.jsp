<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.util.*, mvc.twitter.*"
%>

<%
if(request.getMethod().equals("POST")){
	request.setCharacterEncoding("UTF-8");

}
%>

<jsp:useBean id="twitterDAO" calss="mvc.twitter.TwitterDAO" scope="session" />
<jsp:useBean id="twitterDO" calss="mvc.twitter.TwitterDAO"  />
<jsp:setProperty name="twitterDO" property="message" />

<%
String command = request.getParameter("command");	

	if(request.getMethod().equals("POST") && command != null && command.equals("logout")){
		session.invalidate();
		response.sendRedirect("twitterLogin.jsp");
		
	}
		else {
			if(request.getMethod().equals("POST") && command != null && command.equals("twitterInsert")){
				twitterDO.setId((String)session.getAttribute("id"));
				twitterDAO.insertTwitter(twitterDO);
			}
			
			
		ArrayList<TwitterDO> list = twitterDAO.getAllTwitter();
		String result = "";
	
		for(TwitterDO tDO : list){
			result += "<li>" + tDO.getId() + " ::: " + tDO.getMessage() + " ::: " + tDO.getDate() + "</li>";
		}
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
</head>

<body>

	<h2>My Simple Twitter!!</h2>
	<hr />
	
	<form method="POST">
		<fieldset> 	
			<label><%= session.getAttribute("id") %>@<%= session.getAttribute("name") %></label>
			<input type="text" name="message" size="50" />
			<input type="hidden" name="command" value="twitterInsert" />
			<input type="submit" value="등록" />
		</fieldset>
	</form>
	
	<h3>트위터 리스트 / <</h3>
	<ul>
		 <%= result %>
	</ul>
	
	<hr />
	<form method="POST">
		<input type="hidden" name="command" value="logout" />
		<input type="submit" value="로그아웃" />
	</form>
	

</body>
</html>

<%
		}
%>