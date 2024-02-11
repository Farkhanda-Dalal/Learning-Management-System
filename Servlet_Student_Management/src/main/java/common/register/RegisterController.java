package common.register;

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
import faculty.model.Faculty;
import student.dao.StudentDao;
import student.dao.StudentDaoImpl;
import student.model.Student;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	Integer iobj;
	int i;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	public void formInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		
		String name=request.getParameter("fname")+" "+request.getParameter("lname");
		String email=request.getParameter("email");
		String mobNo=request.getParameter("mobNo");
		String pass=request.getParameter("pass");
		String conPass=request.getParameter("conPass");
		String secQuest=request.getParameter("secQuest");
		String secAns=request.getParameter("secAns");
		String gender=request.getParameter("gender");

		if(conPass.equals(pass))
		{
			if(request.getParameter("studentForm")!=null)
			{
				int rollNo=Integer.parseInt(request.getParameter("rollNo"));
				String batchNo=request.getParameter("bNo");
				Student s=new Student(name, rollNo, email, mobNo, batchNo, pass, secQuest, secAns,gender);
				StudentDao sdao=new StudentDaoImpl();
				i=sdao.Register(s);
				iobj=i;
			}
			if(request.getParameter("teacherForm")!=null)
			{
				String id=request.getParameter("tId");
				Faculty f=new Faculty(name, id, email, mobNo, conPass, secQuest, secAns, gender);
				FacultyDao fdao=new FacultyDaoImpl();
				i=fdao.Register(f);
				iobj=i;
			}
			
			if(i>0)
			{
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			else
			{
				session.setAttribute("message", iobj);
				response.sendRedirect("Register.jsp");
			}
		}
		else
		{
			boolean b=false;
			Boolean bool=Boolean.valueOf(b);
			session.setAttribute("result", bool);
			response.sendRedirect("Register.jsp");
		}
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RegisterController rc=new RegisterController();
		if(request.getParameter("studentForm")!=null)
		{
			rc.formInfo(request, response);
		}
		if(request.getParameter("teacherForm")!=null)
		{
			rc.formInfo(request, response);
		}
	}

}
