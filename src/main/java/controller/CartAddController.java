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
 * Servlet implementation class CartAddController
 */
@WebServlet("/addToCart")
public class CartAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pidString = request.getParameter("pid");
		String qtyString = request.getParameter("qty");
		int pid = (pidString != null) ? Integer.parseInt(pidString) : 0;
		int qty = (qtyString != null) ? Integer.parseInt(qtyString) : 0;
		if (pid != 0 && qty != 0) {
			CartControlService cartServive = new CartControlService();

			// 取得購物車清單 cookie
			Cookie cartCookie = cartServive.getCookie(request);
			String cartDataString = "";
			if (cartCookie == null) {
				// 若購物車清單 cookie 為空直，則執行建立 cookie value method
				cartDataString += cartServive.createCartDataJsonString(pid, qty);
				cartCookie = new Cookie("cartData", URLEncoder.encode(cartDataString, "utf-8"));
			} else {
				// 若存在購物車清單 cookie，則執行資料更新 method
				cartDataString += cartServive
						.updateCartDataJsonString(cartCookie.getValue(), pid, qty, false);

				// 更新 cookie value
				cartCookie.setValue(URLEncoder.encode(cartDataString, "utf-8"));
			}

			// 設定 cookie 存活時間為 7 天，並將 cookie 放入 response
			cartCookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cartCookie);

			// 將結果 response 回前端
			response.setContentType("text/xml;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(cartDataString);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
