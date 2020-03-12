package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.GetConnection;

public class Post {

	
public String getPosts(String topicId) {
	String query = "SELECT * FROM posts WHERE topic_id = ?";
	Connection myConn;
	String topic = "";
	String data = "";
	int topicIdInt = Integer.parseInt(topicId); 
	try {
		myConn = GetConnection.getMySQLConnection();
	//	Statement myStatement = myConn.createStatement();
		PreparedStatement pStat1 = myConn.prepareStatement(query);
		pStat1.setInt(1, topicIdInt);

		ResultSet myRs = pStat1.executeQuery();
		//ResultSet myRs = myStatement.executeQuery(query);
		ResultSet myRs2;

		while (myRs.next()) {
			int votes = myRs.getInt("votes");
			int postId = myRs.getInt("post_id");
			String postContent = myRs.getString("post_content");
			int topic_id = myRs.getInt("topic_id");
			String user_id = myRs.getString("username");
			String title = myRs.getString("title");
			String uuid = myRs.getString("uuid");
	 String query2 = "SELECT * FROM topics AS t WHERE t.topic_id = ?";
		PreparedStatement pStat = myConn.prepareStatement(query2);
		pStat.setInt(1, topic_id);
		myRs2 = pStat.executeQuery();
		if(myRs2.next()) {
		topic = myRs2.getString("topic_name");
			}
		data += postId + "," + votes  +"," + topic + "," + postContent +"," + user_id +"," + title + "," + uuid;
		data += "*";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return data;
}

public String getImage() {
	String query = "SELECT * FROM images";
	String images = "";
	Connection myConn = GetConnection.getMySQLConnection();

try {
	Statement myStatement = myConn.createStatement();
	ResultSet myRs = myStatement.executeQuery(query);
	while (myRs.next()) {
		images += myRs.getString("image");
		images += "*";
	}
}catch(Exception e) {};
	return images;
}

public static String getUsername(String postuuid) {
	String query = "SELECT * FROM posts WHERE uuid = ?";
	Connection myConn;
	String username = "";

	try {
		myConn = GetConnection.getMySQLConnection();

		PreparedStatement pStat = myConn.prepareStatement(query);
		pStat.setString(1, postuuid);

		ResultSet rs = pStat.executeQuery();
		while( rs.next()) {
			username = rs.getString("username");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return username;
}

public void createNewPost(String postContent, String username, int topicID, String uuid, int votes, String title) {
	Connection myConn;
	String query = "INSERT INTO posts (post_content, username , topic_id, uuid, votes, title) VALUES (?, ?, ?,?,?,?)";

	try {
		myConn = GetConnection.getMySQLConnection();

		PreparedStatement pStat = myConn.prepareStatement(query);

		pStat.setString(1, postContent);
		pStat.setString(2, username);
		pStat.setInt(3, topicID);
		pStat.setString(4, uuid);
		pStat.setInt(5, votes);
		pStat.setString(6, title);

		pStat.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
}
