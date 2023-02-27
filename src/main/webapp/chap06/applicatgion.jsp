<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	application.setAttribute("userName","김연경");
	application.setAttribute("job","배구선수");
	
	application.log("application.jsp 로그 생성!");
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>applicatgion.jsp</title>
</head>

<body>

	<h1>applicatgion 내장 객체 예제</h1>
	<hr />
	
	<h4>서버 정보: <%= application.getServerInfo() %></h4>
	<h4>Servlet API Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></h4>
	<h4>application.jsp 실제 경로: <%= application.getRealPath("application.jsp") %></h4>
	<hr />
	
	<h2>application 저장소 확인 </h2>
	<h4><a href="applicationResult.jsp">확인</a></h4>
				 
	
</body>
</html>