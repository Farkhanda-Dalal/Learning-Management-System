package student.controller;

import java.io.IOException;
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
import student.dao.StudentDao;
import student.dao.StudentDaoImpl;
import student.model.Student;

/**
 * Servlet implementation class StudentDashboardController
 */
@WebServlet("/StudentDashboardController")
public class StudentDashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentDashboardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("REACHED SC");

		HttpSession session=request.getSession();
		
		Student stud=(Student)session.getAttribute("info");
		String name=stud.getName();
		String email=stud.getEmail();
		int rollNo=stud.getRollNo();
		
		if(stud!=null)
		{
			if(session.getAttribute("jsp_sender")==null)
			{
				session.setAttribute("jsp_sender", true);
				System.out.println("stud not null");
				session.setAttribute("name", name);
				response.sendRedirect("StudentDashboard.jsp");
				return;
			}
		}
		

		if(request.getParameter("join_class")!=null)
		{
			System.out.println("reached join class");
			String c_name=request.getParameter("c_name");
			String c_id=request.getParameter("c_id");
			String s_name=request.getParameter("s_name");

			FacultyDao fdao=new FacultyDaoImpl();
			ResultSet rs=fdao.classVerify(c_id);

			try {
				if(rs.next())
				{
					if((rs.getString(1).equals(c_name))&&rs.getString(2).equals(c_id))
					{
						System.out.println("returned from rs successfully");
						System.out.println(rs.getString("c_name"));
						StudentDao sdao=new StudentDaoImpl();
						ResultSet r=sdao.studentVerify(rollNo);

						if(r.next())
						{
							if((r.getString(2).equalsIgnoreCase(s_name))&&r.getInt(1)==rollNo)
							{
								System.out.println("wrong");
								List<String> enrollList=new ArrayList<>();
								enrollList.add(c_name);
								enrollList.add(c_id);
								enrollList.add(s_name);

								int e=sdao.Enroll(enrollList, rollNo);

								if(e>0)
								{
									System.out.println(e);
									Integer eobj=e;
									session.setAttribute("enrolled", eobj);
									response.sendRedirect("StudentDashboard.jsp");
								}
							}
							else
							{
								boolean b=false;
								Boolean bool=Boolean.valueOf(b);
								session.setAttribute("result", bool);
								response.sendRedirect("StudentDashboard.jsp");
							}
						}
						else
						{
							boolean b1=false;
							Boolean bool1=Boolean.valueOf(b1);
							session.setAttribute("roll", bool1);
							response.sendRedirect("StudentDashboard.jsp");
						}
					}
					else
					{
						int i=0;
						Integer iobj=i;
						session.setAttribute("error", iobj);
						response.sendRedirect("StudentDashboard.jsp");
					}
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Boolean slider=Boolean.parseBoolean(request.getParameter("slider"));
		if(slider!=null&&slider==false)
		{
			StudentDao sdao=new StudentDaoImpl();
			List<String> classList=sdao.classLoader(rollNo);
			
			if(classList!=null)
			{
				System.out.println("not null");
				
				for(String s:classList)
				{
					System.out.println(s);
				}
				
				if(classList!=null)
				{
					session.setAttribute("list", classList);
					response.sendRedirect("StudentDashboard.jsp");
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("leave_class")!=null)
		{
			String c_name=request.getParameter("c_name");
			String c_id=request.getParameter("c_id");
			int rollNo=Integer.parseInt(request.getParameter("rollNo"));
			String pass=request.getParameter("pass");


			System.out.println(c_name);
			System.out.println(c_id);
			System.out.println(rollNo);
			System.out.println(pass);
		}

	}

}
