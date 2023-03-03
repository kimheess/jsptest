<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.util.* , mvc.twitter.*"
%>

<%	
	@SuppressWarnings("unchecked")
	ArrayList<TwitterDO> list = (ArrayList<TwitterDO>)session.getAttribute("list");
	String result = "";

	for(TwitterDO tDO : list){
		result += "<li>" + tDO.getId() + " ::: " + tDO.getMessage() + " ::: " + tDO.getCreateDate() + "</li>";
	}
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>twitterList.jsp</title>
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
	
	<h3>트위터 리스트 </h3>
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
