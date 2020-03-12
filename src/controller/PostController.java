package controller;
import javax.script.*;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Command;
import model.Post;
import model.Query;

import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.UUID;
/**
 * Servlet implementation class PostController
 */
@WebServlet("/PostController")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Got into post controller GET");
		String title = request.getParameter("title");
		//String votes = request.getParameter("votes");
		String postuuid = request.getParameter("uuid");
		String desc = request.getParameter("desc");
		

		
		
		//Get post info to pass to page to display
		String postInfo = title + "|" + desc + "|" + Post.getUsername(postuuid);
		request.setAttribute("postinfo", postInfo);
		
		//Gets all comments for corresponding post ID/name from model
		Query comments = new Query();
		
		//Check for new events
		comments.checkEvents();
		System.out.println("POSTUUID: 		" + postuuid);
		String commentList = comments.getComments(postuuid);
		System.out.println("Comments -------" + commentList);
		request.setAttribute("comments", commentList);
		HttpSession session = request.getSession();
		session.setAttribute("postUUID", postuuid);
		RequestDispatcher rd = request.getRequestDispatcher("thread.jsp");
		rd.forward(request, response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Got into post controller POST");
		//String title = request.getParameter("title");
		//String votes = request.getParameter("votes");
		String postuuid = (String)request.getAttribute("parentUUID");
		//String desc = request.getParameter("desc");
		
		//Gets all comments for corresponding post ID/name from model
		Query comments = new Query();
		String postInfo = comments.getPostInfo(postuuid);
		request.setAttribute("postinfo", postInfo);

		//Check for new events
		comments.checkEvents();
		System.out.println("POSTUUID: 		" + postuuid);
		String commentList = comments.getComments(postuuid);
		System.out.println("Comments -------" + commentList);
		request.setAttribute("comments", commentList);
		HttpSession session = request.getSession();
		session.setAttribute("postUUID", postuuid);
		RequestDispatcher rd = request.getRequestDispatcher("thread.jsp");
		rd.forward(request, response);	
			}

}


