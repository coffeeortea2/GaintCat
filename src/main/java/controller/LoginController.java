package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoginBean;
import model.LoginService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginService loginService;

    public void init() {
    	loginService = new LoginService();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        LoginBean loginBean = loginService.validate(email, password);
        
        if(loginBean.getMemberID() != 0) {
        	HttpSession session = request.getSession();
        	session.setAttribute("name", loginBean.getName());
        	session.setAttribute("member_id", loginBean.getMemberID());
        	String authority = (loginBean.getAuthority() != null) ? loginBean.getAuthority() : "";
        	session.setAttribute("authority", authority);
        	if (authority.equals("admin")) {
        		response.sendRedirect("admin.jsp");
        	} else {
        		response.sendRedirect("index.jsp");
        	}
        } else {
        	request.setAttribute("message", "Login Fail! Please try again.");
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}