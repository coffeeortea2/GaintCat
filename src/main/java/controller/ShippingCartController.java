package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CartData;
import bean.OrderData;
import bean.OrderPriceData;
import model.CartControlService;

/**
 * Servlet implementation class ShippingCartController
 */
@WebServlet("/cart")
public class ShippingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CartControlService cartService = new CartControlService();
		
		// 取得現有的購物車品項資訊 cookie
		Cookie cartCookie = cartService.getCookie(request);
		
		// 判斷 cart 的內容是否為空值
		if (cartCookie != null) {
			// 將取出的 cart 資料轉換回 ArrayList 資料
			ArrayList<CartData> cartDatas = cartService.cartJsonStringConverToArrayList(cartCookie.getValue());
			ArrayList<CartData> finalCartDatas = cartService.getCartItemInventory(cartDatas);
			OrderPriceData priceData = cartService.orderPriceCalculate(finalCartDatas);
			
			OrderData orderData = new OrderData();
			orderData.setCartData(finalCartDatas);
			orderData.setSubtotal(priceData.getSubtotal());
			orderData.setTotal(priceData.getTotal());
			orderData.setShippingCost(priceData.getShippingCost());
			
			// 將資料放入 request，並將畫面導引至 cart.jsp 呈現資料
			request.setAttribute("orderData", orderData);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else {
			// 若為空值，將畫面導致商品清單頁面
			response.sendRedirect("shopGrid");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
