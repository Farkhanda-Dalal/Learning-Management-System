package common.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faculty.dao.FacultyDao;
import faculty.dao.FacultyDaoImpl;
import faculty.model.Faculty;
import student.dao.StudentDao;
import student.dao.StudentDaoImpl;
import student.model.Student;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void log(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		if(request.getParameter("user").equals("teacher"))
		{
			FacultyDao fdao=new FacultyDaoImpl();
			ResultSet rs=fdao.Login(email);
			
			try {
				if(rs.next())
				{
					String id=rs.getString(3);
					if((rs.getString(1).equals(email))&&(rs.getString(2).equals(pass)))
					{
						System.out.println("Id: "+id);
						session.setAttribute("teacher_id", id);
						response.sendRedirect("TeacherDashboardController");
					}
					else
					{
						boolean b=false;
						Boolean bool=Boolean.valueOf(b);
						session.setAttribute("result", bool);
						response.sendRedirect("Login.jsp");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("user").equals("student"))
		{
			StudentDao sdao=new StudentDaoImpl();
			ResultSet rs=sdao.Login(email);
			
			try {
				if(rs.next())
				{
					int rollNo=rs.getInt(3);
					String name=rs.getString(4);
					
					if((rs.getString(1).equals(email))&&(rs.getString(2).equals(pass)))
					{
						Student s=new Student(name, rollNo, email, null, null, null, null, null, null);
						session.setAttribute("info", s);
						response.sendRedirect("StudentDashboardController");
					}
					else
					{
						boolean b=false;
						Boolean bool=Boolean.valueOf(b);
						session.setAttribute("result", bool);
						response.sendRedirect("Login.jsp");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginController lc=new LoginController();
		lc.log(request,response);
	}

}
