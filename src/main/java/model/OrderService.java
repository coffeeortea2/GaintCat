package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.CartData;
import bean.CountryData;
import bean.OrderData;
import helper.DBHelper;

public class OrderService {
	private Connection conn = DBHelper.getConnection();

	// 取得國家下拉選單資料
	public ArrayList<CountryData> getCountryDatas() {
		ArrayList<CountryData> countryDatas = new ArrayList<>();
		String query = "SELECT id, name, country_code, region FROM country;";
		try {
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				countryDatas.add(new CountryData(resultSet.getInt("id"), resultSet.getString("name"),
						resultSet.getString("country_code"), resultSet.getString("region")));
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return countryDatas;
	}

	// 取得會員地址資料
	public OrderData getMemberAddressData(OrderData orderData, int memberId) {
		String query = "SELECT member.name, member.email, member.phone, member.address_1, member.address_2, member.city, member.zip_code, country.country_code AS country FROM member LEFT JOIN country ON member.country = country.id WHERE member.member_id = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, memberId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				orderData.setName(resultSet.getString("name"));
				orderData.setEmail(resultSet.getString("email"));
				orderData.setPhone(resultSet.getString("phone"));
				orderData.setAddress1(resultSet.getString("address_1"));
				orderData.setAddress2(resultSet.getString("address_2"));
				orderData.setCity(resultSet.getString("city"));
				orderData.setZipCode(resultSet.getString("zip_code"));
				orderData.setCountryCode(resultSet.getString("country"));
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderData;
	}

	// 建立訂單
	public boolean creatNewOrder(OrderData orderData) {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("YYMdHHms");
		String dateString = formatter.format(currentTime);
		String orderIDString = String.valueOf(orderData.getMemberId()) + dateString;
		Long orderId = Long.parseLong(orderIDString);
		
		// 項目創建時間，需使用 MySQL date 不能使用 java date，格式不同
		java.sql.Date createDate = new java.sql.Date(new java.util.Date().getTime());

		String orderDataQuery = "INSERT INTO `order` (id, member_id, discount, subtotal, shipping_cost, total, shipping_name, shipping_email, shipping_phone, shipping_add1, shipping_add2, shipping_country, shipping_city, shipping_zipcode, status_id, created) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		String orderItemQuery = "INSERT INTO order_product (order_id, product_id, quantity, created) "
				+ "VALUES (?, ?, ?, ?);";

		// for order data
		PreparedStatement orderDataStatement = null;

		// for order items
		PreparedStatement orderItemsStatement = null;

		// for getting candidate id
		ResultSet resultSet = null;

		try {
			// 啟動 mysql 交易機制
			conn.setAutoCommit(false);
			
			// 執行訂單資料創建動作
			orderDataStatement = conn.prepareStatement(orderDataQuery);
			orderDataStatement.setLong(1, orderId);
			orderDataStatement.setInt(2, orderData.getMemberId());
			orderDataStatement.setBigDecimal(3, orderData.getDiscount());
			orderDataStatement.setBigDecimal(4, orderData.getSubtotal());
			orderDataStatement.setBigDecimal(5, orderData.getShippingCost());
			orderDataStatement.setBigDecimal(6, orderData.getTotal());
			orderDataStatement.setString(7, orderData.getName());
			orderDataStatement.setString(8, orderData.getEmail());
			orderDataStatement.setString(9, orderData.getPhone());
			orderDataStatement.setString(10, orderData.getAddress1());
			orderDataStatement.setString(11, orderData.getAddress2());
			orderDataStatement.setString(12, orderData.getCountryCode());
			orderDataStatement.setString(13, orderData.getCity());
			orderDataStatement.setString(14, orderData.getZipCode());
			orderDataStatement.setInt(15, 1);
			orderDataStatement.setDate(16, createDate);
			int rowAffected = orderDataStatement.executeUpdate();

			//
			// 當訂單資料創建成功時再執行訂單商品創建動作
			//
			if (rowAffected == 1) {
				orderItemsStatement = conn.prepareStatement(orderItemQuery);
				for (CartData cartData : orderData.getCartData()) {
					orderItemsStatement.setLong(1, orderId);
					orderItemsStatement.setInt(2, cartData.getProductId());
					orderItemsStatement.setInt(3, cartData.getQuantity());
					orderItemsStatement.setDate(4, createDate);
					orderItemsStatement.executeUpdate();
				}
				
				// 執行 mysql 所有步驟
				conn.commit();
			} else {
				// 當失敗時 rollback 所有 mysql 執行步驟
				conn.rollback();
			}
			return true;
		} catch (SQLException e) {
			// 當失敗時 rollback 所有 mysql 執行步驟
			System.out.println(e.getMessage());
			try {
				if (conn != null) {
					conn.rollback();
				}
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
			return false;
		} finally {
			try {
				if (resultSet != null) resultSet.close();
				if (orderDataStatement != null) orderDataStatement.close();
				if (orderItemsStatement != null) orderItemsStatement.close();
			} catch (SQLException e3) {
				System.out.println(e3.getMessage());
			}
		}
	}
}
