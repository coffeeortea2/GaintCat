package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberData;
import model.SignupService;

/**
 * Servlet implementation class NewMemberController
 */
@WebServlet("/joinUs")
@MultipartConfig
public class MemberAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final SignupService signupService = new SignupService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("mail");
		boolean check = signupService.emailRepeatCheck(email);
		String resul = (check == true) ? "success" : "fail";
		PrintWriter out = response.getWriter();
		out.println(resul);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = (request.getParameterValues("name")[0]).trim();
		String email = (request.getParameterValues("email")[0]).trim();
		String password = request.getParameterValues("password")[0];
		
		String[] phoneParameter = request.getParameterValues("phone");
		String[] address1Parameter = request.getParameterValues("address1");
		String[] address2Parameter = request.getParameterValues("address2");
		String[] countryParameter = request.getParameterValues("country");
		String[] cityParameter = request.getParameterValues("city");
		String[] zipParameter = request.getParameterValues("zip_code");
		String phone = (phoneParameter != null) ? phoneParameter[0].trim() : null;
		String address1 = (address1Parameter != null) ? address1Parameter[0].trim() : null;
		String address2 = (address2Parameter != null) ? address2Parameter[0].trim() : null;
		String country = (countryParameter != null) ? countryParameter[0] : null;
		String city = (cityParameter != null) ? cityParameter[0].trim() : null;
		String zip = (zipParameter != null) ? zipParameter[0].trim() : null;
		
		int newMemberId = signupService.signupMember(
				new MemberData(name, email, password, phone, address1, address2, country, city, zip));
		PrintWriter out = response.getWriter();
		if (newMemberId != 0) {
			// 當資料寫入成功，進行登入作業，並回傳成功字串
			HttpSession session = request.getSession();
        	session.setAttribute("name", name);
        	session.setAttribute("member_id", newMemberId);
        	session.setAttribute("authority", "");
			out.print("success");
		} else {
			// 當資料寫入失敗，回傳錯誤字串
			out.print("fail");
		}
	}

}
