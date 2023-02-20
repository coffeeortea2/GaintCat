package model;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import bean.CartData;
import bean.OrderPriceData;
import bean.ProductListData;
import helper.DBHelper;

public class CartControlService {
	private Connection conn = DBHelper.getConnection();

	// 建立全新的購物車清單 JSON string
	public String createCartDataJsonString(int pid, int qty) {
		ArrayList<CartData> cartDatas = new ArrayList<>();
		ProductListData data = getProductPrice(pid);
		cartDatas.add(new CartData(pid, data.getTitle(), qty, data.getPrice(), data.getSmall_img()));

		// 將 ArrayList 轉換為 JSON 格式，並回傳
		return (new GsonBuilder().create()).toJson(cartDatas);
	}

	// 更新購物車清單 JSON string
	public String updateCartDataJsonString(String cartDataString, int pid, int qty, boolean isUpdate) {
		// 將 JSON string 轉換回 ArrayList
		ArrayList<CartData> cartDatas = cartJsonStringConverToArrayList(cartDataString);

		// 確認新的商品是否已存在於 ArrayList 之中，
		// 有則更新現有 ArrayList 相應項目中的 quantity 即可，
		// 沒有則將新商品加入 ArrayList 之中
		boolean itemExists = cartDatas.stream().anyMatch(data -> data.getProductId() == pid);
		if (itemExists) {
			cartDatas.forEach(data -> {
				if (data.getProductId() == pid) {
					if (isUpdate == false) {
						data.setQuantity(data.getQuantity() + qty);
					} else {
						data.setQuantity(qty);
					}
				}
			});
		} else {
			ProductListData data = getProductPrice(pid);
			cartDatas.add(new CartData(pid, data.getTitle(), qty, data.getPrice(), data.getSmall_img()));
		}

		// 將 ArrayList 轉換為 JSON 格式，並回傳
		return (new GsonBuilder().create()).toJson(cartDatas);
	}

	// 移除購物車商其中的商品
	public String removeCartItemJsonString(String cartDataString, int pid) {
		// 將 JSON string 轉換回 ArrayList
		ArrayList<CartData> cartDatas = cartJsonStringConverToArrayList(cartDataString);

		// 使用 ArrayList 內建的 removeIf 方法將 product id 等於要刪除的 id 項目刪除
		cartDatas.removeIf(cartData -> cartData.getProductId() == pid);

		// 將 ArrayList 轉換為 JSON 格式，並回傳
		return (new GsonBuilder().create()).toJson(cartDatas);
	}

	// 取得購物車清單 cookie
	public Cookie getCookie(HttpServletRequest request) {
		if (request.getCookies() != null) {
			for (Cookie cookie : request.getCookies()) {
				if (cookie.getName().equals("cartData")) {
					return cookie;
				}
			}
		}
		return null;
	}

	// 取得商品售價、小圖片資料
	public ProductListData getProductPrice(int pid) {
		String query = "SELECT title, price, small_img FROM product WHERE id = ?";
		try {
			ProductListData result = new ProductListData();
			PreparedStatement priceStatement = conn.prepareStatement(query);
			priceStatement.setInt(1, pid);
			ResultSet priceResultSet = priceStatement.executeQuery();
			while (priceResultSet.next()) {
				result.setTitle(priceResultSet.getString("title"));
				result.setPrice(priceResultSet.getBigDecimal("price"));
				result.setSmall_img(priceResultSet.getString("small_img"));
			}
			priceResultSet.close();
			priceStatement.close();
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 將 JSON 字串轉換回 ArrayList
	public ArrayList<CartData> cartJsonStringConverToArrayList(String encodeStringData) {
		ArrayList<CartData> arrayListData = new ArrayList<>();
		try {
			String decodeStringData = URLDecoder.decode(encodeStringData, "utf-8");
			arrayListData.addAll((new Gson()).fromJson(decodeStringData, new TypeToken<ArrayList<CartData>>() {
			}.getType()));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return arrayListData;
	}

	// 取得購物車內商品的現有庫存量
	public ArrayList<CartData> getCartItemInventory(ArrayList<CartData> cartDatas) {
		String query = "SELECT inventory FROM product WHERE id = ?";
		try {
			for (CartData cartData : cartDatas) {
				int pid = cartData.getProductId();
				PreparedStatement inventoryStatement = conn.prepareStatement(query);
				inventoryStatement.setInt(1, pid);
				ResultSet inventoryResultSet = inventoryStatement.executeQuery();
				while (inventoryResultSet.next()) {
					cartData.setInventory(inventoryResultSet.getInt("inventory"));
				}
				inventoryResultSet.close();
				inventoryStatement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartDatas;
	}

	// 計算訂單的各項金額
	public OrderPriceData orderPriceCalculate(ArrayList<CartData> finalCartDatas) {
		OrderPriceData priceData = new OrderPriceData();
		BigDecimal subtotal = new BigDecimal(0);
		BigDecimal total = new BigDecimal(0);
		BigDecimal shippingCost = new BigDecimal(0);
		BigDecimal discount = new BigDecimal(0);
		for (CartData cartData : finalCartDatas) {
			subtotal = subtotal.add(new BigDecimal(cartData.getQuantity()).multiply(cartData.getPrice()));
		}
		priceData.setSubtotal(subtotal);
		priceData.setShippingCost(shippingCost);
		priceData.setDiscount(discount);
		total = (discount.equals(new BigDecimal(0))) ? (subtotal.add(shippingCost)).multiply(discount) : subtotal.add(shippingCost);
		priceData.setTotal(total);

		return priceData;
	}
}
