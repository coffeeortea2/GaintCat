package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartControlService;

/**
 * Servlet implementation class CartUpdateController
 */
@WebServlet("/updateCart")
public class CartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 取得要更新的品項ID與更新的數量
		int pid = Integer.parseInt(request.getParameter("pid"));
		int qty = Integer.parseInt(request.getParameter("qty"));

		CartControlService cartService = new CartControlService();

		// 取得現有的購物車品項資訊 cookie
		Cookie cartCookie = cartService.getCookie(request);
		
		// 取出 cookie 內容，傳送至 cartServive.updateCartDataJsonString() 方法進行 cookie 資料更新
		String cartString = cartCookie.getValue();
		String newCartCookieString = cartService.updateCartDataJsonString(cartString, pid, qty, true);
		
		// 重設 cookie
		cartCookie.setValue(URLEncoder.encode(newCartCookieString, "utf-8"));

		// 設定 cookie 存活時間為 7 天，並將 cookie 放入 response
		cartCookie.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cartCookie);
		
		response.sendRedirect("./cart");
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
