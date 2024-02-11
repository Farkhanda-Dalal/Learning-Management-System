package common.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtpController
 */
@WebServlet("/ValidateOtpController")
public class ValidateOtpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ValidateOtpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("reached validate otp");

		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();

		System.out.println("reached sub");
		Integer i=(Integer) session.getAttribute("otp");
		int sentOtp=i;
		if(sentOtp!=0)
		{
			if (session.getAttribute("correct") == null) {
				session.setAttribute("correct", true);
				response.sendRedirect("EnterOtp.jsp");
			}
		}

		if(request.getParameter("submit")!=null)
		{
			int enteredOtp=Integer.parseInt(request.getParameter("enteredOtp"));
			
			if(sentOtp==enteredOtp)
			{
				response.sendRedirect("NewPassword.jsp");
			}
			else
			{
				Boolean b=Boolean.valueOf(false);
				session.setAttribute("message", b);
				response.sendRedirect("ForgotPassword.jsp");
			}
		}

	}

	

}
