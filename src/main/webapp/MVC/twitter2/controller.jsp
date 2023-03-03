<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.util.*, mvc.twitter.*"
%>


<%
	if(request.getMethod().equals("POST")){  //한글 안꺠지게 
		request.setCharacterEncoding("UTF-8");
	}	

%>

<jsp:useBean id="twitterDAO" class="mvc.twitter.TwitterDAO" scope="session" />
<jsp:useBean id="twitterDO" class="mvc.twitter.TwitterDO" scope="page" />
<jsp:useBean id="loginDO" class="mvc.twitter.TwitterLoginDO" scope="page"/>
<jsp:setProperty name="twitterDO" property="message" />
<jsp:setProperty name="loginDO" property="*" />


<%
	String viewPath = "/WEB-INF/views/twitter2/"; //-> 뷰의 위치 
	String command = request.getParameter("command"); 			// command 파라미터 받아오기  로그아웃 기능 

	if(session.getAttribute("id") == null ){
		if(request.getMethod().equals("GET")){ // -> (1)(로그인이 안됐는데 GET으로 요청이 왔음) =>(1) forward / twitterLogin 
			pageContext.forward(viewPath + "twitterLogin.jsp");
		}
		else if(request.getMethod().equals("POST")){ //(2) 로그인 요청  성공 여부에 따라 화면이 달라짐
			TwitterLoginDO tDO =  twitterDAO.checkLogin(loginDO);			// --> loginDO를 반환 이름 필요 
			
			if(tDO != null){							// 1)로그인 성공 시 세션에 id와 name 저장 
				session.setAttribute("id",tDO.getId());			
				session.setAttribute("name",tDO.getName());		
				
				response.sendRedirect("controller.jsp");  //	sendRedirect 방식		// 1)마지막 else 문으로 간다 
				// session.setAttribute("list",twitterDAO.getAllTwitter()); //
				// pageContext.forward(viewPath + "twitterList.jsp"); // 		forward 방식 하지만 코드 중복으로 	sendRedirect 쓴다 
			}
			else{				// -> 로그인 실패시  다시 로그인 페이지로 보낸다 
				pageContext.forward(viewPath + "twitterLogin.jsp");
			}
		}
	}
	else {																// 1) 로그인 성공 이쪽으로 이동 한다. 

		if (command != null && command.equals("logout")){                // (3) 로그아웃을 누를시에 작동 
			session.invalidate();										// 세션 소멸 
			response.sendRedirect("controller.jsp");						//controller 에게 다시 요청 -> (1)로 이동 (로그아웃 ))
		}
		else{
			if(command != null && command.equals("twitterInsert")){ 	 	// (4) 트윗 등록을 누를시에 작동 한다 
				twitterDO.setId((String)session.getAttribute("id"));		//세션 id 값을 받아와서 (형변환 해준후에 )
				twitterDAO.insertTwitter(twitterDO);						//DAO에 있는 insertTwitter 메소드 동작 
				
				
			}
			session.setAttribute("list",twitterDAO.getAllTwitter());  // (5) 공통 기능 (로그아웃이 아니면 화면 보여주기) 
			pageContext.forward(viewPath + "twitterList.jsp");
		}
		
	}
%>


























