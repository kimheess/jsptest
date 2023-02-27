<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
</head>

<body>

		<hr />

	<form action="redirect.jsp" method="POST">
		<fieldset>
			<legend>redirect test</legend>
			<label for=username>이름</label>
			<input type="text" name="username" id="username"/>
			<input type="submit" value="전송"/>
		</fieldset>
	</form>

</body>
</html>