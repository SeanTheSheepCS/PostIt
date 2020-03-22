package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConnection {
	private static Connection conn;
	public PreparedStatement pStat;
	public ResultSet myRs;
	
	public static Connection getMySQLConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(System.getenv("CLEAR_DB_URL"), System.getenv("CLEARDB_DB_USERNAME"), System.getenv("CLEARDB_DB_PASSWORD"));
			return conn;
			} 
		
		catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	//	catch (ClassNotFoundException e) {
	//		e.printStackTrace();
	//	}
		return null;
	}
}
