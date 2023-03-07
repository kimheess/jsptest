<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	//String myName = "김연아";
	request.setAttribute("myName", "김연아");
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>elResult.jsp</title>
</head>

<body>

	<h2>EL Result</h2>
	<hr />
	
	${pageScope.pageElTest}<br />
	${requestScope.reqElTest}<br />
	${sessionScope.sesElTest}<br />
	${applicationScope.appElTest}<br />
	${param.userName }<br />
	${paramValues.favorite[0]} /${paramValues.favorite[1]}<br />
	${cookie.elCookie.name}=${cookie.elCookie.value}<br />
	adminID: ${initParam.adminID}/ admin passwd:${initParam.adminPasswd }<br />
	사용자 이름: ${myName}<br />
</body>
</html>