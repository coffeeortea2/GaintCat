package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartData;
import bean.CountryData;
import bean.OrderData;
import bean.OrderPriceData;
import model.CartControlService;
import model.OrderService;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int memberId = 15; // 先強制會員ID為 15 
		if(session.getAttribute("member_id") != null) {
			memberId = (int) session.getAttribute("member_id");
		}
		
		CartControlService cartService = new CartControlService();
		OrderService orderService = new OrderService();

		// 取得現有的購物車品項資訊 cookie
		Cookie cartCookie = cartService.getCookie(request);
		ArrayList<CartData> cartDatas = cartService.cartJsonStringConverToArrayList(cartCookie.getValue());
		ArrayList<CartData> finalCartDatas = cartService.getCartItemInventory(cartDatas);
		OrderPriceData priceData = cartService.orderPriceCalculate(finalCartDatas);
		
		OrderData orderData = new OrderData();
		orderData.setCartData(finalCartDatas);
		orderData.setSubtotal(priceData.getSubtotal());
		orderData.setTotal(priceData.getTotal());
		orderData.setShippingCost(priceData.getShippingCost());
		
		orderData = orderService.getMemberAddressData(orderData, memberId);
		
		ArrayList<CountryData> countryDatas = orderService.getCountryDatas();
		
		request.setAttribute("orderData", orderData);
		request.setAttribute("countryData", countryDatas);
		request.getRequestDispatcher("./checkout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
