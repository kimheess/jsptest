<%@ page  contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="bean" class="mvc.cart.CartBean" scope="session" />

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}

	String command = request.getParameter("command");
	String viewPath = "/WEB-INF/views/cart2/";
	
	if(session.getAttribute("id") == null){ //로그인 상태 //아이디가 null이면 
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "login.jsp");  // --> 없는 아이디면 그냥 로그인화면 보여라
		}
		else if(request.getMethod().equals("POST")){ // --> 있는 아이디면 그냥 로그인화면 보여라
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			if(bean.checkLogin(id, passwd)){   // --> 로그인 성공이면 이동 
				session.setAttribute("id", id); 	// 세션에 아이디 저장 후에 
				pageContext.forward(viewPath + "selProduct.jsp"); // 셀프로덕트로 이동 
			}
			else{	// --> 로그인 실패시 
				response.sendRedirect("controller.jsp"); // --> 메인 페이지로 보낸다 
			}
		}
	}
	else if(command != null && command.equals("logout")){ //로그아웃 기능 
		session.invalidate(); // 세션 삭제 
		response.sendRedirect("controller.jsp"); 
	}

	else if(command != null && command.equals("addCart")){ //장바구니 추가  
		String product = request.getParameter("product"); // 사용자가 선택한 상품 
		bean.addProduct(product); //사용자가 선택한 상품을 addProduct 저장 
		request.setAttribute("script", "alert('" + product + " 상품을 구매 했습니다 ');"); //자바스크립트로 구매한 상품 출력 
		pageContext.forward(viewPath + "selProduct.jsp"); // 계속 페이지 유지 
	}

	else if(command != null && command.equals("checkOut")){ // 장바구니 확인 기능 
		if(session.getAttribute("productList") == null){
			session.setAttribute("productList",bean.getProductList());
		}
		pageContext.forward(viewPath + "checkOut.jsp"); 
		
		}
	else if(command != null && command.equals("clearCart")){
		bean.clearProduct();		// 장바구니 비우기 
		pageContext.forward(viewPath + "selProduct.jsp");
	}
	
	
	else{
		pageContext.forward(viewPath + "selProduct.jsp");
	}
%>