package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartData;
import bean.OrderData;
import bean.OrderPriceData;
import model.CartControlService;
import model.OrderService;

/**
 * Servlet implementation class OrderAddController
 */
@WebServlet("/newOrder")
@MultipartConfig
public class OrderAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int memberId = 15; // 先強制會員ID為 15 
		if(session.getAttribute("member_id") != null) {
			memberId = (int) session.getAttribute("member_id");
		}
		
		request.setCharacterEncoding("UTF-8");
		String name = (request.getParameterValues("name")[0]).trim();
		String email = (request.getParameterValues("email")[0]).trim();
		String phone = (request.getParameterValues("phone")[0]).trim();
		String address1 = (request.getParameterValues("address1")[0]).trim();
		String[] address2Parameter = request.getParameterValues("address2");
		String address2 = (address2Parameter != null) ? address2Parameter[0].trim() : null;
		String country = (request.getParameterValues("country")[0]);
		String city = (request.getParameterValues("city")[0]).trim();
		String zip = (request.getParameterValues("zip")[0]).trim();
		
		CartControlService cartService = new CartControlService();
		OrderService orderService = new OrderService();
		Cookie cartCookie = cartService.getCookie(request);
		ArrayList<CartData> cartDatas = cartService.cartJsonStringConverToArrayList(cartCookie.getValue());
		OrderPriceData priceData = cartService.orderPriceCalculate(cartDatas);
		OrderData orderData = new OrderData();
		orderData.setCartData(cartDatas);
		orderData.setSubtotal(priceData.getSubtotal());
		orderData.setDiscount(priceData.getDiscount());
		orderData.setTotal(priceData.getTotal());
		orderData.setShippingCost(priceData.getShippingCost());
		orderData.setName(name);
		orderData.setEmail(email);
		orderData.setPhone(phone);
		orderData.setAddress1(address1);
		orderData.setAddress2(address2);
		orderData.setCountryCode(country);
		orderData.setCity(city);
		orderData.setZipCode(zip);
		orderData.setMemberId(memberId);
		
		PrintWriter out = response.getWriter();
		boolean result = orderService.creatNewOrder(orderData);
		if (result == true) {
			// 當資料寫入成功，刪除 cookie，並回傳成功字串
			cartCookie.setMaxAge(0);
			response.addCookie(cartCookie);
			out.print("success");
		} else {
			// 當資料寫入失敗，回傳錯誤字串
			out.print("fail");
		}
	}

}
