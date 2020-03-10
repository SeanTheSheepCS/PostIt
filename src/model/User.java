package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.GetConnection;

public class User {

	public boolean validateUser(String username, String pass) {
		String query = "SELECT * FROM users WHERE username = ? AND password = ?";
		Connection myConn;
		try {
			myConn = GetConnection.getMySQLConnection();

			PreparedStatement pStat = myConn.prepareStatement(query);
			pStat.setString(1, username);
			pStat.setString(2, pass);

			ResultSet rs = pStat.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean checkUserExist(String username) {

		String query = "SELECT * FROM users WHERE username = ?";
		Connection myConn;
		try {
			myConn = GetConnection.getMySQLConnection();

			PreparedStatement pStat = myConn.prepareStatement(query);
			pStat.setString(1, username);

			ResultSet rs = pStat.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public void addUser(String uName, String pwd) {
		Connection myConn;
		String query = "INSERT INTO users (Username, Password) VALUES (?, ?)";

		try {
			myConn = GetConnection.getMySQLConnection();

			PreparedStatement pStat = myConn.prepareStatement(query);

			pStat.setString(1, uName);
			pStat.setString(2, pwd);
			pStat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
