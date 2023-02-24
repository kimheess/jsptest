<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	String name = "손흥민";
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
%>

<div id="footer">
	<h3>[회사소개] [찾아오시는 길] [페이지맵]</h3>
	<h2>email : <%= email %>/ tel: <%= tel %></h2>
</div>