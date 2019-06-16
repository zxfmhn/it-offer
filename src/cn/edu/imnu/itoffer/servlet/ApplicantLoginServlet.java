package cn.edu.imnu.itoffer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.imnu.itoffer.bean.Applicant;
import cn.edu.imnu.itoffer.dao.ApplicantDAO;
import cn.edu.imnu.itoffer.util.CookieEncryptTool;

/**
 * Servlet implementation class ApplicantLoginServlet
 */
@WebServlet("/ApplicantLoginServlet")
public class ApplicantLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String rememberMe;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicantLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ApplicantDAO dao = new ApplicantDAO();
		int applicantID = dao.login(email,password);
		if(applicantID !=0) {
			Applicant applicant = new Applicant(applicantID,email,password);
			request.getSession().setAttribute("SESSION_APPLICANT", applicant);	
			rememberMe(rememberMe,email,password,request,response);
			int resumeID = dao.isExistResume(applicantID);
		if(resumeID !=0) {
			request.getSession().setAttribute("SESSION_RESUMEID", resumeID);
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("resumeGuide.jsp");
		}
		doGet(request, response);
	}else {
		out.print("<script type='text/javascript'>");
		out.print("alert('用户名或密码错误，请重新输入!');");
		out.print("window.location='login.jsp';");
		out.print("</script>");
	}
	}
	private void rememberMe(String rememberMe,String email,String password,HttpServletRequest request,HttpServletResponse response) {
		if("true".equals(rememberMe)) {
			Cookie cookie = new Cookie("COOKIE_APPLICANTEMAIL",CookieEncryptTool.decodeBase64(email));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);
			cookie = new Cookie("COOKIE_APPLICANTPWD",CookieEncryptTool.encodeBase64(password));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);									
		}else {
			Cookie[]cookies = request.getCookies();
			if(cookies!= null) {
				for(Cookie cookie:cookies) {
					if("COOKIE_APPLICANTEMALL".equals(cookie.getName())||"COOKIE_APPLICANTPWD".equals(cookie.getName())){
						cookie.setMaxAge(0);
						cookie.setPath("/");
						response.addCookie(cookie);
						
					}
				}
			}
		}
	}

}

