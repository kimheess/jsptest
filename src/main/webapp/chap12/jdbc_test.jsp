<%@ page  contentType="text/html; charset=UTF-8"
		  import="javax.naming.*, java.sql.*, javax.sql.*"
%>

<%
		DataSource ds = null;
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String list = "";
		
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		// 등록 기능을 구현하는 코드를 작성하세요.
		if(request.getMethod().equals("POST")){
			request.setCharacterEncoding("UTF-8");
			sql = "insert into jdbc_test values(?, ?)";
		
			try{
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,request.getParameter("username"));
				pstmt.setString(2,request.getParameter("email"));
				pstmt.executeUpdate();
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}		
		      finally {
		          try {
		             if(!pstmt.isClosed()) {
		                 pstmt.close();
		             }
		             
		             if(!conn.isClosed()) {
			             conn.close();
			         }
		             
		          }
		          catch (Exception e) {
		             e.printStackTrace();
		          }
		       }
		    }

	

		sql= "select * from jdbc_test";
		
		
		try{
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				list += "<li>" + rs.getString("username") + " | " + rs.getString("email") + "</li>";
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(!stmt.isClosed()){
					stmt.close();
				}
				
				if(!conn.isClosed()){
					conn.close();
				}
			}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>jdbc_test.jsp</title>
</head>

<body>
	
	<h1>JDBC Test</h1>
	<hr />
	
	<form method="POST">
	<fieldset>
		<legend>정보 등록</legend>
		<label for="username">이름</label>
		<input type="text" name="username" id="username" /> /
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" />
		<input type="submit" value="등록" />
		
	</fieldset>
	</form>
	
	<hr />
	
	<h3>등록 목록</h3>
	
	<ol>
		<%= list %>
	</ol>
</body>
</html>