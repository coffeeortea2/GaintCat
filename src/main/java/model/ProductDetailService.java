package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ProductDetailData;
import helper.DBHelper;

public class ProductDetailService {
	// 取得資料庫連線資訊
	private Connection conn = DBHelper.getConnection();
	
	// 取得商品詳細資訊
	public ProductDetailData getProductDetailData(int pid) {
		String query = "SELECT product.id, brand.brand_name, category.name AS category_name, product.title, product.detail, product.price, product.vip_discount, product.inventory, product.length, product.width, product.height, product.weight, product.big_img1, product.big_img2, product.big_img3, product.big_img4, product.big_img5 "
				+ "FROM product "
				+ "LEFT JOIN brand ON product.brand_id = brand.brand_id "
				+ "LEFT JOIN category ON product.category_id = category.id "
				+ "WHERE product.id = ? AND product.isUsed = 1;";
		
		try {
			ProductDetailData data = new ProductDetailData();
			PreparedStatement productStatement = conn.prepareStatement(query);
			productStatement.setInt(1, pid);
			ResultSet productResultSet = productStatement.executeQuery();
			while (productResultSet.next()) {
				data.setId(productResultSet.getInt("id"));
				data.setBrandName(productResultSet.getString("brand_name"));
				data.setCategoryName(productResultSet.getString("category_name"));
				data.setTitle(productResultSet.getString("title"));
				data.setDetail(productResultSet.getString("detail"));
				data.setPrice(productResultSet.getBigDecimal("price"));
				data.setVip_discount(productResultSet.getBigDecimal("vip_discount"));
				data.setInventory(productResultSet.getInt("inventory"));
				data.setLength(productResultSet.getDouble("length"));
				data.setWidth(productResultSet.getDouble("width"));
				data.setHeight(productResultSet.getDouble("height"));
				data.setWeight(productResultSet.getDouble("weight"));
				data.setBig_img1(productResultSet.getString("big_img1"));
				data.setBig_img2(productResultSet.getString("big_img2"));
				data.setBig_img3(productResultSet.getString("big_img3"));
				data.setBig_img4(productResultSet.getString("big_img4"));
				data.setBig_img5(productResultSet.getString("big_img5"));
			}
			productResultSet.close();
			productStatement.close();
			return data;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
			// TODO: handle exception
		}
	}
}
