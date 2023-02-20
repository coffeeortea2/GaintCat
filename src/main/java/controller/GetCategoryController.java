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

import bean.ProdcutCategory;
import model.ShopGridService;

/**
 * Servlet implementation class GetCategoryController
 */
@WebServlet("/get/category")
public class GetCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 呼叫處理資料的 service
		ShopGridService shopGridService = new ShopGridService();
		
		// 透過 service 回傳產品分類的資料
		ArrayList<ProdcutCategory> categorys = shopGridService.getCategory();
		
		// 透過 GSON 套件，將查詢結果轉換為 JSON 格式
		Gson gson = new GsonBuilder().create();
		String jsonString = gson.toJson(categorys);
		
		// 將結果 response 回前端
		response.setContentType("text/xml;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(jsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
