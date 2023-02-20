package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import bean.ProductListData;
import bean.ProductListShow;
import model.ShopGridService;

/**
 * Servlet implementation class ProductListShowByBrand
 */
@WebServlet("/getPrd/brand")
public class ProductListShowByBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String brandString = request.getParameter("brand");
		String pageString = request.getParameter("page");
		String sortString = request.getParameter("sort");

		String[] brandStringArray = brandString.split(",");
		int[] brands = new int[brandStringArray.length];
		for (int i = 0; i < brandStringArray.length; i++) {
			brands[i] = Integer.parseInt(brandStringArray[i]);
		}

		ShopGridService shopGridService = new ShopGridService();

		int page = Integer.parseInt(pageString);
		int sort = Integer.parseInt(sortString);

		// 取得分頁商品清單
		ArrayList<ProductListData> productListDatads = shopGridService.getProductListByBrand(brands, sort, page);

		// 取得總筆數
		int totalRow = shopGridService.getCountFromBrand(brands);

		// 取得總頁數，使用無條件進位取整數
		double p = (double) totalRow / 12;
		int totalPage = (int) Math.ceil(p);

		// 產生回傳用的 class
		ProductListShow prdDatas = new ProductListShow();
		prdDatas.setTotalPage(totalPage);
		prdDatas.setTotalRow(totalRow);
		prdDatas.setProducts(productListDatads);

		// 透過 GSON 套件，將查詢結果轉換為 JSON 格式
		Gson gson = new GsonBuilder().create();
		String jsonString = gson.toJson(prdDatas);

		// 將結果 response 回前端
		response.setContentType("text/xml;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(jsonString);
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
