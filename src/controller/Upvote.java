package controller;

import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.GetConnection;
import model.Model;

@WebServlet("/Upvote")
public class Upvote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Model model;

	public Upvote() {
		super();
		model = new Model();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IN UPVOTE CONTROLLER");

		String postUUID = request.getParameter("uuid");
		String votes = request.getParameter("votes");

		System.out.println("postUUID: "+ postUUID + "votes: "+ votes);

		model.upvote(postUUID);

		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IN UPVOTE CONTROLLER--doPost");
		Connection myConn;
		
		HttpSession session = request.getSession();
		System.out.println("Username while doing upvote: " + session.getAttribute("username"));
		
		
		//String postUUID = (String) session.getAttribute("uuid");
		String postUUID = request.getParameter("uuid");
		String votes = (String) session.getAttribute("votes");
		String username = (String) session.getAttribute("username");
		//System.out.println("!!!!!!!!!!!!!THE USERNAME:"+ username);
		
		//to Ensure that not already liked
		String selectQuery = "SELECT * FROM userlikesanddislikes WHERE username = ? AND post_id = ?";
		
		try {
			myConn = GetConnection.getMySQLConnection();

			PreparedStatement pStat = myConn.prepareStatement(selectQuery);
			pStat.setString(1, username);
			pStat.setString(2, postUUID);

			ResultSet rs = pStat.executeQuery();
			
			System.out.println("printing straight from result set: " + rs);
			Array liked = rs.getArray("liked_if_true_disliked_if_false");
			System.out.print(liked.toString());
			//if (liked.)
		
			
			
			/*
			String addLikeQuery = "INSERT INTO userlikesanddislikes (username, post_id, liked_if_true_disliked_if_false) VALUES (?, ?, ?)";

			

			PreparedStatement pStatInsert = myConn.prepareStatement(addLikeQuery);

			pStatInsert.setString(1, username);
			pStatInsert.setString(2, postUUID);
			//pStat.setString(3, 0);
			pStatInsert.setInt(3, 0);
			
			pStatInsert.executeUpdate();
			
			//System.out.println("MUZHDA added to new table");
			//myConn.close();
*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		System.out.println(postUUID + votes);

		model.upvote(postUUID);

		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request, response);
		
	}

	
	/*
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection myConn;
		System.out.println("IN UPVOTE CONTROLLER");

		String postUUID = request.getParameter("uuid");
		String votes = request.getParameter("votes");
		String username = request.getParameter("username");
		
		//storing likes 
		String addLikeQuery = "INSERT INTO userlikesanddislikes (username, post_id, liked_if_true_disliked_if_false) VALUES (?, ?, ?)";

		try {
			myConn = GetConnection.getMySQLConnection();
			

			PreparedStatement pStat = myConn.prepareStatement(addLikeQuery);

			pStat.setString(1, username);
			pStat.setString(2, postUUID);
			pStat.setString(3, "true");
			
			pStat.executeUpdate();
			
			System.out.println("MUZHDA added to new table");
			//myConn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		

		System.out.println(postUUID + votes);

		model.upvote(postUUID);

		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request, response);
	}
	*/
	
	
	
/*	
	public void storeLikes(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection myConn;
		
		String postUUID = request.getParameter("uuid");
		String votes = request.getParameter("votes");
		String username = request.getParameter("username");
		
		
		//Need new column in User named likes that stores post/comment ID 
		// we dont have an upvotes or downvotes table right? we need to store this information
		String query = "INSERT INTO userslikeanddislikes (username, post_id, liked_if_true_disliked_if_false) VALUES (?, ?, ?)";

		try {
			myConn = GetConnection.getMySQLConnection();
			

			PreparedStatement pStat = myConn.prepareStatement(query);

			pStat.setString(1, uName);
			pStat.setString(2, pwd);
			pStat.setString(3, email);
			pStat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boolean checkLikes(String username, int id) {

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
	*/
}
