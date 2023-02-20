package model;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.BrandList;
import bean.ChildCategory;
import bean.ProdcutCategory;
import bean.ProductListData;
import helper.DBHelper;

public class ShopGridService {
	// 取得資料庫連線資訊
	 private Connection conn = DBHelper.getConnection();

	// 回傳 product category 資料集合的方法
	public ArrayList<ProdcutCategory> getCategory() {
		// 宣告此 method 要 return 的 ArrayList
		// Java bean 為 ProdcutCategory
		ArrayList<ProdcutCategory> categoryData = new ArrayList<>();

		// 由於前段處理畫面需要，因此需撈兩次資料庫，
		// getParentQuery: 撈出主要分類
		// getChildQuery: 透過資料庫中的 parent_id 撈出子分類
		String getParentQuery = "SELECT id, name FROM category WHERE isParent = 1 AND isUsed = 1;";
		String getChildQuery = "SELECT id, name FROM category WHERE isParent = 2 AND isUsed = 1 AND parent_id = ?;";
		
		// 由於執行 PreparedStatement 與 ResultSet 會拋出錯誤，因此需使用 try catch 進行錯誤處理
		try {
			// 執行 conn.prepareStatement method 並導入 SQL，回傳 PreparedStatement
			PreparedStatement parentStatement = conn.prepareStatement(getParentQuery);

			// PreparedStatement.executeQuery() 方法執行資料庫查找
			ResultSet parentResultSet = parentStatement.executeQuery();

			ResultSetMetaData rsmd = parentResultSet.getMetaData();

			int columnCount = rsmd.getColumnCount();

			// 透過 while 迴圈接收所有查詢到的結果
			while (parentResultSet.next()) {
				// new 一個要放查詢結果的 class，並透過 setter 將結果放入其中
				ProdcutCategory parentData = new ProdcutCategory();

				for (int i = 0; i < columnCount; i++) {
					Object columnValue = parentResultSet.getObject(i + 1);
					String columnLabel = rsmd.getColumnLabel(i + 1);
					try {
						Field field = ProdcutCategory.class.getDeclaredField(columnLabel);
						field.setAccessible(true);
						field.set(parentData, columnValue);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				// 最後將上方產生的 class 透過 add() 的方式新增到最終回傳的 ArrayList 中
				categoryData.add(parentData);
			}
			parentResultSet.close(); // 關閉 ResultSet
			parentStatement.close(); // 關閉 statement

			// 透過上面的步驟，最終回傳的 ArrayList 已有 parent category 資料在其中，
			// 因此透過 foreach 迴圈的方式將 parent id 帶入到第二段資料庫查詢之中
			for (ProdcutCategory prodcutCategory : categoryData) {
				// 宣告 一個要放所有 child category 資料的 ArrayList
				// Java bean 為 ChildCategory
				ArrayList<ChildCategory> childCategories = new ArrayList<>();

				// 取出 parent id
				int pID = prodcutCategory.getId();

				// 開始執行 child category 查詢
				PreparedStatement childStatement = conn.prepareStatement(getChildQuery);

				// 由於 getChildQuery 查詢語法中有包含動態變數 "parent_id = ?"
				// 因此要透過 setInt(int parameterIndex, int x) 的方式將變數引入 statement 之中
				childStatement.setInt(1, pID);

				// 送出查詢
				ResultSet childResultSet = childStatement.executeQuery();

				ResultSetMetaData crsmd = childResultSet.getMetaData();

				int childColumnCount = crsmd.getColumnCount();

				while (childResultSet.next()) {
					// new 一個要放查詢結果的 class，並透過 setter 將結果放入其中
					ChildCategory childData = new ChildCategory();

					for (int i = 0; i < childColumnCount; i++) {
						String childColumnLabel = crsmd.getColumnLabel(i + 1);
						Object columnValue = childResultSet.getObject(i + 1);
						try {
							Field childField = ChildCategory.class.getDeclaredField(childColumnLabel);
							childField.setAccessible(true);
							childField.set(childData, columnValue);
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
					}

					// 最後將上方產生的 class 透過 add() 的方式新增到 ArrayList<ChildCategory> childCategories 中
					childCategories.add(childData);
				}
				childResultSet.close(); // 關閉 ResultSet
				childStatement.close(); // 關閉 statement

				// 最後將產生好的 childCategories 透過 setter 放入 categoryData 中
				prodcutCategory.setChildCategories(childCategories);
			}

			// 將最終結果 return 出來
			return categoryData;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
			// TODO: handle exception
		}
	}

	// 取得廠商清單
	public ArrayList<BrandList> getBrand() {
		ArrayList<BrandList> brandData = new ArrayList<>();
		String getBrandQuery = "SELECT brand_id, brand_name FROM brand;";
		try {
			PreparedStatement brandStatement = conn.prepareStatement(getBrandQuery);
			ResultSet brandResultSet = brandStatement.executeQuery();
			while (brandResultSet.next()) {
				brandData.add(new BrandList(brandResultSet.getInt(1), brandResultSet.getString(2)));
			}
			brandResultSet.close();
			brandStatement.close();

			return brandData;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 取得產品列表資料
	// 傳入參數:
	// 1. sort: 判斷排序方法(1: ASC, 2: DESC)
	// 2. page: 使用者點到的頁數
	// 備註：由於前端沒有做每頁顯是幾比的功能，因此設定每頁固定顯示 12 筆資料
	public ArrayList<ProductListData> getProductListByCategory(int category, int sort, int page) {
		ArrayList<ProductListData> productListData = new ArrayList<>();
		String query = "SELECT id, title, price, vip_discount, small_img FROM product ";
		if (category == 0) {
			query += "WHERE isUsed = 1 ";
		} else {
			query += "WHERE category_id = ? AND isUsed = 1 ";
		}
		String orderBy = (sort == 0) ? "ASC" : "DESC";
		query += "ORDER BY price " + orderBy + " LIMIT ?, 12;";
		int start = (page * 12) - 12;
		
		try {
			PreparedStatement prdListStatement = conn.prepareStatement(query);
			if (category == 0) {
				prdListStatement.setInt(1, start);
			} else {
				prdListStatement.setInt(1, category);
				prdListStatement.setInt(2, start);
			}
			ResultSet prdListResultSet = prdListStatement.executeQuery();
			
			ResultSetMetaData rsmd = prdListResultSet.getMetaData();
			int columnCount = rsmd.getColumnCount();
			
			while (prdListResultSet.next()) {
				ProductListData data = new ProductListData();
				for(int i = 0; i < columnCount; i++) {
					String columnLabel = rsmd.getColumnLabel(i + 1);
					Object columnValue = prdListResultSet.getObject(i + 1);
					try {
						Field field = ProductListData.class.getDeclaredField(columnLabel);
						field.setAccessible(true);
						field.set(data, columnValue);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
				productListData.add(data);
			}
			prdListResultSet.close();
			prdListStatement.close();

			return productListData;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public ArrayList<ProductListData> getProductListByBrand(int[] brands, int sort, int page) {
		int brandLength = brands.length;
		ArrayList<ProductListData> productListData = new ArrayList<>();
		String query = "SELECT id, title, price, vip_discount, small_img FROM product WHERE isUsed = 1 AND brand_id IN (";
		String[] in = new String[brands.length];
		for (int i = 0; i < brandLength; i++) {
			in[i] = "?";
		}
		query += String.join(",", in) + ") ";
		String orderBy = (sort == 0) ? "ASC" : "DESC";
		query += "ORDER BY price " + orderBy + " LIMIT ?, 12;";
		int start = (page * 12) - 12;
		
		try {
			PreparedStatement prdListStatement = conn.prepareStatement(query);
			for (int i = 0; i < brandLength; i++) {
				prdListStatement.setInt(i + 1, brands[i]);
			}
			prdListStatement.setInt(brandLength + 1, start);
			ResultSet prdListResultSet = prdListStatement.executeQuery();
			while (prdListResultSet.next()) {
				productListData.add(new ProductListData(prdListResultSet.getInt(1), prdListResultSet.getString(2),
						prdListResultSet.getBigDecimal(3), prdListResultSet.getBigDecimal(4), prdListResultSet.getString(5)));
			}
			prdListResultSet.close();
			prdListStatement.close();

			return productListData;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 透過金額範圍查詢產品
	public ArrayList<ProductListData> getProductListByPriceRange(int range, int sort, int page) {
		ArrayList<ProductListData> productListData = new ArrayList<>();
		String query = "";
		switch (range) {
		case 1:
			query += "SELECT id, title, price, vip_discount, small_img FROM product WHERE isUsed = 1 AND price < 10 ";
			break;
		case 2:
		case 3:
		case 4:
			query += "SELECT id, title, price, vip_discount, small_img FROM product WHERE isUsed = 1 AND (price BETWEEN ? AND ?) ";
			break;
		case 5:
			query += "SELECT id, title, price, vip_discount, small_img FROM product WHERE isUsed = 1 AND price > 100 ";
			break;
		}
		String orderBy = (sort == 0) ? "ASC" : "DESC";
		query += "ORDER BY price " + orderBy + " LIMIT ?, 12;";
		int start = (page * 12) - 12;

		double min = 0;
		double max = 0;
		if (range == 2) {
			min += 10;
			max += 39.99;
		} else if (range == 3) {
			min += 40;
			max += 69.99;
		} else if (range == 4) {
			min += 70;
			max += 99.99;
		}
		
		try {
			PreparedStatement prdListStatement = conn.prepareStatement(query);
			if (range == 2 || range == 3 || range == 4) {
				prdListStatement.setDouble(1, min);
				prdListStatement.setDouble(2, max);
				prdListStatement.setInt(3, start);
			} else {
				prdListStatement.setInt(1, start);
			}
			ResultSet prdListResultSet = prdListStatement.executeQuery();
			while (prdListResultSet.next()) {
				productListData.add(new ProductListData(prdListResultSet.getInt(1), prdListResultSet.getString(2),
						prdListResultSet.getBigDecimal(3), prdListResultSet.getBigDecimal(4), prdListResultSet.getString(5)));
			}
			prdListResultSet.close();
			prdListStatement.close();

			return productListData;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 取得分類下的產品總數
	public int getCountFromCategory(int category) {
		String query = "";
		if (category != 0) {
			query += "SELECT COUNT(id) FROM product WHERE category_id = ? AND isUsed = 1;";
		} else {
			query += "SELECT COUNT(id) FROM product WHERE isUsed = 1;";
		}
		
		try {
			int result = 0;
			PreparedStatement countStatement = conn.prepareStatement(query);
			if (category != 0) {
				countStatement.setInt(1, category);
			}
			ResultSet countResultSet = countStatement.executeQuery();
			while (countResultSet.next()) {
				result += countResultSet.getInt(1);
			}
			countResultSet.close();
			countStatement.close();

			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	// 透過供應商 ID 查詢總筆數
	public int getCountFromBrand(int[] brands) {
		int brandLength = brands.length;

		// 由於使用者勾選的供應商沒有固定，因此需透過迴圈的方式產生 sql 查詢語句
		String query = "SELECT COUNT(id) FROM product WHERE isUsed = 1 AND brand_id IN (";
		String[] in = new String[brands.length];
		for (int i = 0; i < brandLength; i++) {
			in[i] = "?";
		}
		query += String.join(",", in);
		query += ")";
		
		try {
			int result = 0;
			PreparedStatement countStatement = conn.prepareStatement(query);
			for (int i = 0; i < brandLength; i++) {
				countStatement.setInt(i + 1, brands[i]);
			}
			ResultSet countResultSet = countStatement.executeQuery();
			if (countResultSet.next()) {
				result += countResultSet.getInt(1);
			}
			countResultSet.close();
			countStatement.close();

			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	// 透過供應商 ID 查詢總筆數
	public int getCountFromPriceRange(int range) {
		String query = "";
		switch (range) {
		case 1:
			query += "SELECT COUNT(id) FROM product WHERE isUsed = 1 AND price < 10;";
			break;
		case 2:
		case 3:
		case 4:
			query += "SELECT COUNT(id) FROM product WHERE isUsed = 1 AND price BETWEEN ? AND ?;";
			break;
		case 5:
			query += "SELECT COUNT(id) FROM product WHERE isUsed = 1 AND price < 100;";
			break;
		}

		double min = 0;
		double max = 0;
		if (range == 2) {
			min += 10;
			max += 39.99;
		} else if (range == 3) {
			min += 40;
			max += 69.99;
		} else if (range == 4) {
			min += 70;
			max += 99.99;
		}
		
		try {
			int result = 0;
			PreparedStatement countStatement = conn.prepareStatement(query);
			if (range == 2 || range == 3 || range == 4) {
				countStatement.setDouble(1, min);
				countStatement.setDouble(2, max);
			}
			ResultSet countResultSet = countStatement.executeQuery();
			while (countResultSet.next()) {
				result += countResultSet.getInt(1);
			}
			countResultSet.close();
			countStatement.close();

			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
}
