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
			conn = DriverManager.getConnection("jdbc:mysql://sql3.freesqldatabase.com:3306/sql3327526", "sql3327526", "FgYxT9fCwI");	
		//	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/401", "root", "");
		//	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "kuraikami");	

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
