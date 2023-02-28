<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.util.*"
%>

<%

	/*
	checkOut.jsp 예제의 보완 사항
	1. 로그인 한 사용자만 이용할 수 있다.
	2. 로그인 하지 않는 사용자의 접근은 로그인 페이지로 리다이렉팅 한다.
	3. 장바구니 비우기 기능 
	4. 상품 구매 페이지로 이동
	*/	


	ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
	String products = "";
	if(list == null){
		products = "<h4>구매하신 상품이 없습니다</h4>";		
	}
	else {
		for(String product : list){
			products += "<h5>" + product + "</h5>";
		}
		
		session.removeAttribute("ProductList");
	}
	
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>checkOut.jsp</title>
</head>

<body>
	
	<h1>장바구니 확인</h1>
	<hr />
	
	<%= products %>


</body>
</html>