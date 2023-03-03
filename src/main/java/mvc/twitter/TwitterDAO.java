package mvc.twitter;

import java.sql.*;
import java.util.ArrayList;

public class TwitterDAO {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public TwitterDAO()  {
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
	
	public TwitterLoginDO checkLogin(TwitterLoginDO loginDO) {
		TwitterLoginDO result = null;
		this.sql = "select * from twitter_login where id = ? and passwd = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginDO.getId());
			pstmt.setString(2, loginDO.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new TwitterLoginDO();
				result.setId(rs.getString("id"));
				result.setPasswd(rs.getString("passwd"));
				result.setName(rs.getString("name"));
			}
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
		
		return result;
	}
	
	public ArrayList<TwitterDO> getAllTwitter() {
		ArrayList<TwitterDO> list = new ArrayList<TwitterDO>();
		TwitterDO tDO = null;
		this.sql = "select twitter.id || '@' || name as id_name, message, to_char(create_date, 'YYYY/MM/DD HH24:MI:SS') as cdatedtime from twitter inner join twitter_login on twitter.id = twitter_login.id order by no";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				tDO = new TwitterDO();
				tDO.setId(rs.getString("id_name"));
				tDO.setMessage(rs.getString("message"));
				tDO.setCreateDate(rs.getString("cdatedtime"));
				list.add(tDO);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	          try {
	             if(!stmt.isClosed()) {
	                stmt.close();
	             }
	          }
	          catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		
		return list;
	}
	
	public int insertTwitter(TwitterDO tDO) {
		int rowCount = 0;
		sql = "insert into twitter (no, id, message) values(twitter_seq.nextval, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,tDO.getId());
			pstmt.setString(2,tDO.getMessage());
			rowCount = pstmt.executeUpdate();
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
		
		
		return rowCount;
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
