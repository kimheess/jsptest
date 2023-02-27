<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.util.*"
%>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
		
		String product = request.getParameter("product");
		
		if(session.getAttribute("productList") == null){
			session.setAttribute("productList", new ArrayList<String>());
		}
		
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
		list.add(product);
%>		
		<script>
			alert("<%= product %> 상품을 구매했습니다");
			history.back();
		</script>	
<%		
	}
%>