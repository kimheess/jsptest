<%@ page  contentType="text/html; charset=UTF-8"
		  import="java.sql.*"
%>

<%
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String list = "";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(request.getMethod().equals("POST")){
			request.setCharacterEncoding("UTF-8");
			sql = "insert into jdbc_test values(?, ?)";
		
			try{
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
		          }
		          catch (Exception e) {
		             e.printStackTrace();
		          }
		       }
		    }

	

		sql= "select * from jdbc_test";
		
		
		try{
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
			}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		try{
			if(!conn.isClosed()){
				conn.close();
			}
		}
	
	catch (SQLException e) {
		e.printStackTrace();
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