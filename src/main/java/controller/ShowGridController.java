package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BrandList;
import bean.ProdcutCategory;
import model.ShopGridService;

/**
 * Servlet implementation class ShowGridController
 */
@WebServlet("/shopGrid")
public class ShowGridController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ShopGridService shopGridService = new ShopGridService();
		ArrayList<ProdcutCategory> categorys = shopGridService.getCategory();
		ArrayList<BrandList> brandLists = shopGridService.getBrand();
		request.setAttribute("categorys", categorys);
		request.setAttribute("brands", brandLists);
		request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
