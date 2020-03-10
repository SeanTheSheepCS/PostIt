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
//		ScriptEngineManager manager = new ScriptEngineManager();
//		ScriptEngine engine = manager.getEngineByName("javascript");
//
//		FileInputStream fileInputStream = new FileInputStream("C:\\Users\\Owner\\Desktop\\SENG 401\\PostIt\\WebContent\\js\\control.js");
//		      if (fileInputStream != null)
//		{
//		                BufferedReader reader = new BufferedReader(new InputStreamReader(fileInputStream));
//		                try {
//							engine.eval(reader);
//						
//
//		     Invocable invocableEngine = (Invocable)engine;
//		     Object object = invocableEngine.invokeFunction("welcome", "jaja");
//		     System.out.println("After calling js method");
//		                }catch (ScriptException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						} catch (NoSuchMethodException e) {
//					// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//		}
				RequestDispatcher rd = request.getRequestDispatcher("thread.jsp");
				rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*
	ScriptEngine engine = new ScriptEngineManager().getEngineByName("nashorn");
		try {
			engine.eval("print('Welcome to javascript execution using java')");
			engine.eval(new FileReader("C:\\Users\\Owner\\Desktop\\SENG 401\\PostIt\\WebContent\\js\\control.js"));
			
			Invocable invocable = (Invocable)engine;
			System.out.println("before js method");
			invocable.invokeFunction("welcome", "jaja");
			System.out.println("after js method");

		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(FileNotFoundException e) {
			System.out.println("JS File not found!");
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		RequestDispatcher rd = request.getRequestDispatcher("thread.html");
		rd.forward(request, response);	
 */
	}

}




/*

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
RequestDispatcher rd = request.getRequestDispatcher("thread.html");
rd.forward(request, response);	
}

*/