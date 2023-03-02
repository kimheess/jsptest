package chap08;

import java.sql.*;
import java.util.ArrayList;

public class JdbcTestDAO {
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public JdbcTestDAO()  {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertJdbcTest(JdbcTestDO testDo) {
		int rowCount = 0;
		
		sql = "insert into jdbc_test values(?, ?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,testDo.getUsername());
			pstmt.setString(2,testDo.getEmail());
			pstmt.executeUpdate();
			
		}
		catch (SQLException e) {
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
		
		return rowCount;
	}
	
	public ArrayList<JdbcTestDO> selectAllJdbcTest() {
		ArrayList<JdbcTestDO> list = new ArrayList<JdbcTestDO>();
		JdbcTestDO testDO = null;
		
		this.sql= "select * from jdbc_test";
		
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				testDO =	 new JdbcTestDO(); 
				testDO.setUsername(rs.getString("username"))	;	
				testDO.setEmail(rs.getString("email"));
				
				list.add(testDO);
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(!stmt.isClosed()){
					stmt.close();
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public void closeConnection() {
		try{
			if(!conn.isClosed()){
				conn.close();
			}
		}
	
		catch (SQLException e) {
		e.printStackTrace();
		}	
	}
}

