package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Post;

/**
 * Servlet implementation class NewPostController
 */
@WebServlet("/NewPostController")
public class NewPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In new post!");
	String postContent = request.getParameter("content");
		String title = request.getParameter("title");
		HttpSession session = request.getSession();
		//String topic = (String) session.getAttribute("topic");
		//Get topic id 
		int topicID = 1;
		String username = (String) session.getAttribute("username");
		int votes = 0;
		UUID uuid = UUID.randomUUID();
		String randomUUIDString = uuid.toString();
	 				
		Post thePosts = new Post();
		thePosts.createNewPost(postContent, username, topicID, randomUUIDString, votes, title);
		
		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request,response);		
	}

}
