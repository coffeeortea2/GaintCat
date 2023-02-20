package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.ProductDetailData;
import model.ProductDetailService;

/**
 * Servlet implementation class ProductDetailsController
 */
@WebServlet("/prdDetal")
public class ProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pidString = request.getParameter("pid");
		if (pidString == null) {
			response.sendRedirect("./shopGrid");
		} else {
			if (!pidString.matches("^[0-9]*$")) {
				response.sendRedirect("./shopGrid");
			} else {
				int pid = Integer.parseInt(pidString);
				ProductDetailService productDetailService = new ProductDetailService();
				ProductDetailData data = productDetailService.getProductDetailData(pid);
				request.setAttribute("productDetail", data);
				request.getRequestDispatcher("product-details.jsp").forward(request, response);
			}
		}
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
