package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CountryData;
import model.OrderService;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderService orderService = new OrderService();
		ArrayList<CountryData> countryDatas = orderService.getCountryDatas();
		request.setAttribute("countryData", countryDatas);
		request.getRequestDispatcher("./signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String name = request.getParameter("name");
//		String password = request.getParameter("password");
//		String email = request.getParameter("email");
//
//		Signup member = new Signup();
//		member.setName(name);
//		member.setPassword(password);
//		member.setEmail(email);
//
//		try {
//			signupserv.signupMember(member);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		response.sendRedirect("success.jsp");
	}
}
