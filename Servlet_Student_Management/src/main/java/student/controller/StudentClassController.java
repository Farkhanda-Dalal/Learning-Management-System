package student.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student.dao.StudentDao;
import student.dao.StudentDaoImpl;
import student.model.Attendence;
import student.model.Student;

/**
 * Servlet implementation class StudentClassController
 */
@WebServlet("/StudentClassController")
public class StudentClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Student stud=(Student)session.getAttribute("info");
		int rollNo=stud.getRollNo();
		String name=stud.getName();
		String email=stud.getEmail();
		
		if(request.getParameter("Attendence")!=null)
		{
			String status=request.getParameter("status");
			String date=request.getParameter("date");
			Date d=Date.valueOf(date);
			String className=request.getParameter("className");
			
			Attendence a=new Attendence(className, d, name, rollNo, status);
					
				StudentDao sdao=new StudentDaoImpl();
					int i=sdao.attendence(a);
					if(i>0)
					{
						Integer iobj=i;
						session.setAttribute("error", iobj);
						response.sendRedirect("StudentClass.jsp");
					}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
