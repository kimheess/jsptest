<%@ page  contentType="text/html; charset=UTF-8"%>

<%
	/*
		selProduct.jsp 보완 사항 
		1. 로그인한 사용자만 접근할 수 있다.
		2. 로그인 하지 않은 사용자는 로그인 화면으로 보낸다.
		3. 로그아웃 기능을 추가한다.
	*/
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>selProduct.jsp</title>
   <script>
   		<%= request.getAttribute("script") %>
   </script>
</head>

<body>
	
	<h1>상품 구매</h1>
	<hr />
	
	<h4><%= session.getAttribute("id") %> 님을 환영 합니다 ... ^^</h4>
	<form method="POST">
		<input type="hidden" name="command" value="logout" />
		<input type="submit" value="로그아웃" />
	</form>
	
	<hr />
	
	<form method="POST">
	<fieldset>
		<legend>상품 선택</legend>
		<select name="product">
			<option selected>사과</option>
			<option>딸기</option>
			<option>배</option>
			<option>포도</option>
			<option>오렌지</option>
			<option>수박</option>
		</select>
		<input type="hidden" name="command" value="addCart" />
		<input type="submit" value="추가" />
	</fieldset>	
	</form>

	<hr />
	
	<form method="POST">
		<input type="hidden" name="command" value="checkOut" />
		<input type="submit" value="장바구니 확인" />
	</form>

</body>
</html>