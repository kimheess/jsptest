<%@ page  contentType="text/html; charset=UTF-8"%>

<%

%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>out.jsp</title>
</head>

<body>

	<h1>내장 객체</h1>
	<hr />
	
	<h4>1. 버퍼 사이즈: <%= out.getBufferSize() %></h4>
	<h4>2. 여유 버퍼 용량: <%= out.getRemaining() %></h4>
	
	<%
	out.flush();
	%>
	
	<h4>3. flush 후 여유 버퍼 용량: <%= out.getRemaining() %></h4>
	
<%
	out.clear();
%>

	<h4>4. clear 후 여유 버퍼 용량: <%= out.getRemaining() %></h4>
	
<%
	out.close();
%>	

	<h4>5. close 후 여유 버퍼 용량: <%= out.getRemaining() %></h4>
	
</body>
</html>