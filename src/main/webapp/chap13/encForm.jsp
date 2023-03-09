<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>enForm.jsp</title>
</head>

<body>

	<h2>encoding test form</h2>
	<hr />
	
	<form method="POST" action="encResult.jsp">
	<fieldset>
	<legend>인코딩 테스트 폼</legend>
	<label for="kor">한글입력</label>
	<input type="text" name="kor" id="kor" />
	<input type="submit" value="전송" />
	</fieldset>
	</form>
	

</body>
</html>