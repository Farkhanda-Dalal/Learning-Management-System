package faculty.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faculty.dao.FacultyDao;
import faculty.dao.FacultyDaoImpl;
import faculty.model.Class;
import student.dao.StudentDao;
import student.dao.StudentDaoImpl;

/**
 * Servlet implementation class TeacherDashboardController
 */
@WebServlet("/TeacherDashboardController")
public class TeacherDashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;  

	public TeacherDashboardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		System.out.println("reached tc");
		String id = (String) session.getAttribute("teacher_id");
		if (id != null) {
			if (session.getAttribute("dashboard_visited") == null) {
				System.out.println("Teacher-dashboard_visited");
				session.setAttribute("dashboard_visited", true);
				FacultyDao fdao = new FacultyDaoImpl();
				List<String> classList = fdao.classLoader(id);
				session.setAttribute("list", classList);
				response.sendRedirect("TeacherDashboard.jsp");
			}
		}
		
		if(request.getParameter("className")!=null)
		{
			String cName=request.getParameter("className");
			session.setAttribute("cl", cName);
			response.sendRedirect("Class.jsp");
		}

		if(request.getParameter("submit")!=null)
		{
			System.out.println("entered submit");
			String c_name=request.getParameter("c_name");
			String c_id=request.getParameter("c_id");
			String t_id=request.getParameter("t_id");
			String batchNo=request.getParameter("batchNo");

			Class c=new Class(c_name, c_id, t_id,batchNo);
			FacultyDao fdao=new FacultyDaoImpl();
			int i=fdao.createClass(c);

			if(i>0)
			{
				List<String> classList = (List<String>) session.getAttribute("list");

				if (classList == null) {
					classList = new ArrayList<>();
					System.out.println("EMPTY LIST");
				}

				classList.add(c_name);
				TeacherDashboardController tc=new TeacherDashboardController();
				tc.postClassId_Sender(request, response);


				session.setAttribute("list", classList);
				response.sendRedirect("TeacherDashboard.jsp");


			}
			else
			{
				Integer iobj=i;
				session.setAttribute("error", iobj);
				response.sendRedirect("TeacherDashboard.jsp");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		if(request.getParameter("del_class")!=null)
		{
			String c_name=request.getParameter("c_name");
			String c_id=request.getParameter("c_id");
			String t_id=request.getParameter("t_id");
			String pass=request.getParameter("pass");

			FacultyDao fdao=new FacultyDaoImpl();
			ResultSet rs=fdao.verify(t_id);

			try {
				if(rs.next())
				{
					if(t_id.equals(rs.getString(1))&&pass.equals(rs.getString(2)))
					{System.out.println("verified");
					List<String> classList = (List<String>) session.getAttribute("list");
					if(classList!=null)
					{
						System.out.println("list not null");
						int i=fdao.deleteClass(c_id);

						if(i>0)
						{
							classList.remove(c_name);
							System.out.println("removed");
							session.setAttribute("list", classList);
							response.sendRedirect("TeacherDashboard.jsp");
						}
						else
						{
							System.out.println("not deleted");
							boolean b=false;
							Boolean bool=Boolean.valueOf(b);
							session.setAttribute("result", bool);
							response.sendRedirect("TeacherDashboard.jsp");
						}

					}
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	protected void postClassId_Sender(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession mySession=request.getSession();
		System.out.println("reached ClassId_Sender");
		String batchNo=request.getParameter("batchNo");
		String c_name=request.getParameter("c_name");
		String c_id=request.getParameter("c_id");
		StudentDao sdao=new StudentDaoImpl();
		List<String> lstEmail=sdao.emailGetter(batchNo);

		final String username = "7farkhanda@gmail.com"; //your Gmail  address
		final String password = "lgbwgtlpwvxgvoud"; // your Gmail password
		String to=null;
		for(String email:lstEmail)
		{
			to = email; 
			System.out.println("sending mail to:"+email);
		}

		String subject = "Join "+c_name+" Class";
		String body = "Use code: "+c_id+" to join "+c_name+" Class";

		// Set mail properties
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		// Create a session with authentication
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a MimeMessage object
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);

			// Send the email
			try {
				Transport.send(message);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
