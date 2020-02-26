package controller;
import javax.script.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.nio.charset.StandardCharsets;
import java.nio.file.*;
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
		System.out.println("Got into post controller");
		//Gets all comments for corresponding post ID/name from model
		String comments = "Postinfo*hi*this is gay*asofs*wmfka*etc*";
		String postInfo = "";
		String postID = request.getParameter("postid");
		String votes = request.getParameter("votes");
		String topic = request.getParameter("topic");
		String description = request.getParameter("desc");
		String title = request.getParameter("title");
		
			postInfo += postID + votes + topic + description;
		System.out.println(postInfo);
		
		//CALL QUERY SIDE CQRS AND GET COMMENTS USING POST ID
		//img src, content of post
		request.setAttribute("comments", comments);
		RequestDispatcher rd = request.getRequestDispatcher("/post.jsp");
		rd.forward(request, response);	
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("JavaScript");
		// read script file
	//	engine.eval(Files.newBufferedReader(Paths.get("C:/Scripts/Jsfunctions.js"), StandardCharsets.UTF_8));

		Invocable inv = (Invocable) engine;
		// call function from script file
	//	inv.invokeFunction("yourFunction", "param");		doGet(request, response);
	}

}
