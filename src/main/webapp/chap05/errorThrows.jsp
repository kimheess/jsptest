<%@ page  contentType="text/html; charset=UTF-8" 
		  errorPage="error.jsp"
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>errorThrows.jsp</title>
</head>

<body>

	<h2>현재 JSP 문서에서 예외가 발생했습니다.</h2>
	<hr />
	
<%
	int num1 = 10, num2 = 0;
	int result = num1 / num2;
%>

	<h4>계산결과 : <%= result %></h4>

</body>
</html>