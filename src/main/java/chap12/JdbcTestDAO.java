package chap12;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTestDAO {
	private DataSource ds = null;
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public JdbcTestDAO()  {
		
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertJdbcTest(JdbcTestDO testDo) {
		int rowCount = 0;
		
		sql = "insert into jdbc_test values(?, ?)";
		
		try{
			conn = ds.getConnection();
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
	             if(!conn.isClosed()) {
		                conn.close();
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
			conn = ds.getConnection();
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
				
				if(!conn.isClosed()){
					conn.close();
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}

