<%@ page  contentType="text/html; charset=UTF-8"%>

<%

	String username = request.getParameter("username");
	String email = "kim@naver.com";
	String url = "pageControlEnd.jsp?";
	url += "username=" + username + "&";
	url += "email=" + email;
	
	response.sendRedirect(url);
%>