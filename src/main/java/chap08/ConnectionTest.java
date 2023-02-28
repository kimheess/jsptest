package chap08;

import java.sql.*;

public class ConnectionTest {

	public static void main(String[] args) {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		Connection conn = null;
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, pwd);
			
			System.out.println(conn.isClosed() ? "연결 실패!" : "연결 성공!");
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(!conn.isClosed()) {
					conn.close();
					System.out.println(conn.isClosed() ? "연결 종료" : "");
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
