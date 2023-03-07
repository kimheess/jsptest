<%@ page  contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="product" class="chap10.Product" scope="session" />

<%
	String [] productList = product.getProductList();
	String result = "";
	
	for(String prod : productList){
		result += "<option>" + prod + "</option>";
	}
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>productList.jsp</title>
</head>

<body>
	
	<h2>EL Test</h2>
	<hr />
	
	<form method="POST" action="productSel.jsp">
	<fieldset>
		<legend>상품 선택</legend>
		<select name="sel">
			<%= result %>
		</select>
		<input type="submit" value="전송" />
		</fieldset>

	</form>
	


</body>
</html>