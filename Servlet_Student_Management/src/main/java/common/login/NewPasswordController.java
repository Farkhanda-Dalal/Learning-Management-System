package common.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faculty.dao.FacultyDao;
import faculty.dao.FacultyDaoImpl;
import student.dao.StudentDao;
import student.dao.StudentDaoImpl;

/**
 * Servlet implementation class NewPasswordController
 */
@WebServlet("/NewPasswordController")
public class NewPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public NewPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("reached post");
		HttpSession session = request.getSession();
		String user = request.getParameter("user");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String conPass = request.getParameter("conPass");
		int i=0;
		if (pass != null && conPass != null && pass.equals(conPass)) {
			
			if(request.getParameter("user").equals("teacher"))
			{
				FacultyDao fdao=new FacultyDaoImpl();
				i=fdao.resetPass(email, pass);
			}
			if(request.getParameter("user").equals("student"))
			{
				StudentDao sdao=new StudentDaoImpl();
				i=sdao.resetPass(email, pass);
			}
			
			Integer iobj=i;
			session.setAttribute("pass", iobj);
			response.sendRedirect("Login.jsp");
			
		}
		else
		{
			boolean b=false;
			Boolean bool=Boolean.valueOf(b);
			session.setAttribute("result", bool);
			response.sendRedirect("NewPassword.jsp");
		}
	}

}
