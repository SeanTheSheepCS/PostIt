package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.GetConnection;

public class Post {

	
public String getPosts() {
	String query = "SELECT * FROM posts";
	Connection myConn;
	String topic = "";
	String data = "";
	try {
		myConn = GetConnection.getMySQLConnection();
		Statement myStatement = myConn.createStatement();
		Statement myStatement2 = myConn.createStatement();
		ResultSet myRs = myStatement.executeQuery(query);
		ResultSet myRs2;

		while (myRs.next()) {
			int votes = myRs.getInt("votes");
			int postId = myRs.getInt("post_id");
			String postContent = myRs.getString("post_content");
			int topic_id = myRs.getInt("topic_id");
			int user_id = myRs.getInt("user_id");
			String title = myRs.getString("title");
	 String query2 = "SELECT * FROM topic AS t WHERE t.topic_id = ?";
		PreparedStatement pStat = myConn.prepareStatement(query2);
		pStat.setInt(1, topic_id);
		myRs2 = pStat.executeQuery();
		if(myRs2.next()) {
		topic = myRs2.getString("topic_name");
			}
		data += postId + "," + votes  +"," + topic + "," + postContent +"," + user_id +"," + title;
		data += "*";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return data;
}
}
