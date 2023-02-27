<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>applicationResult.jsp</title>
</head>

<body>

	<h1>application result</h1>
	<hr />
	
	<h4>이름 : <%= application.getAttribute("userName") %></h4>
	<h4>직업 : <%= application.getAttribute("job") %></h4>


</body>
</html>