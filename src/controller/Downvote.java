package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;

@WebServlet("/Downvote")
public class Downvote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Model model;

	public Downvote() {
		super();
		model = new Model();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IN DOWNVOTE CONTROLLER");

		String postUUID = request.getParameter("uuid");
		String votes = request.getParameter("votes");

		System.out.println(postUUID + votes);

		model.downvote(postUUID);

		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IN DOWNVOTE CONTROLLER");

		String postUUID = request.getParameter("uuid");
		String votes = request.getParameter("votes");

		System.out.println(postUUID + votes);

		model.downvote(postUUID);

		RequestDispatcher rd = request.getRequestDispatcher("/GetPosts");
		rd.forward(request, response);
	}

}
