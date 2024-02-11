package faculty.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import faculty.dao.FacultyDao;
import faculty.dao.FacultyDaoImpl;
import student.model.Attendence;
import student.model.Student;

/**
 * Servlet implementation class ClassController
 */
@WebServlet("/ClassController")
@MultipartConfig
public class ClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ClassController() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();

		if(request.getParameter("attendence")!=null)
		{
			System.out.println("reached attendence");
			String date=request.getParameter("date");
			Date d=Date.valueOf(date);
			String className=request.getParameter("className");
			System.out.println(className);
			System.out.println("hello");

			Attendence a=new Attendence(className, d, null, 0, null);
			FacultyDao fdao=new FacultyDaoImpl();
			List<Attendence> lstAdd=fdao.viewAttendence(a);
			System.out.println("returned from view attendence dao");

			if(lstAdd!=null)
			{
				System.out.println("not null");
				request.setAttribute("attendenceList", lstAdd);
				request.getRequestDispatcher("Class.jsp").forward(request, response);
			}
		}

		if(request.getParameter("enrollment")!=null)
		{
			System.out.println("reached enrollment");
			String className=request.getParameter("className");

			FacultyDao fdao=new FacultyDaoImpl();
			ResultSet rs=fdao.viewEnrollment(className);
			System.out.println("returned from enrollment dao");
			try {
				if(rs.next())
				{
					session.setAttribute("enroll", rs);
					response.sendRedirect("Class.jsp");
				}
				else
				{
					int i=2;
					Integer iobj=i;
					session.setAttribute("error", iobj);
					response.sendRedirect("Class.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("assignment")!=null)
		{
			String className=request.getParameter("className");
			System.out.println("class name:"+className);
			
			Part p=request.getPart("aFile");
			String a_file=p.getSubmittedFileName();
			String content=p.getContentType();
			long size=p.getSize();
			double fileSizeInKB = (double) size / 1024;
			// Round the file size to two decimal places
			double roundedFileSizeInKB = Math.round(fileSizeInKB * 100.0) / 100.0;
			
			String aName=request.getParameter("aName");
			System.out.println("file: "+a_file);
			System.out.println("name: "+aName);
			System.out.println("File Size: " + roundedFileSizeInKB + " KB");
			System.out.println("content:"+content);
			String path=getServletContext().getRealPath("")+"UploadedAssignments";
			System.out.println(path);
			
			File f=new File(path);
			p.write(path+f.separator+aName);
		}
	}

}
