package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class SignupUser
 */
@WebServlet("/SignupUser")
public class SignupUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupUser() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uName = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("mail");
		String pwdConfirm = request.getParameter("pwd-confirm");
		System.out.println(uName + " " +  email + " "  + " " + pwd + " " + pwdConfirm);
	
		User user = new User();
		boolean exist = user.checkUserExist(uName);
		if (exist == true) {
			request.setAttribute("userfail", uName);
			request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		
		else if(pwdConfirm.contentEquals(pwd) == false) {
			request.setAttribute("pwdfail", pwd);
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		else if(uName.isEmpty() || pwd.isEmpty() || email.isEmpty() || pwdConfirm.isEmpty()) {
			request.setAttribute("emptyfail", "Empty");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}

		else {
			user.addUser(uName, pwd);
			HttpSession session = request.getSession();
			session.setAttribute("username", uName);
			request.setAttribute("succ", uName);
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);
		}
		
	}

}
