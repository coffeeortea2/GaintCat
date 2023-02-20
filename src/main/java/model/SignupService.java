package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.MemberData;
import helper.DBHelper;

public class SignupService {
	private Connection conn = DBHelper.getConnection();

	// 驗證信箱是否重複
	public boolean emailRepeatCheck(String email) {
		String query = "SELECT COUNT(member_id) FROM member WHERE email = ?";
		try {
			int result = 0;
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, email);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				result = resultSet.getInt(1);
			}
			resultSet.close();
			statement.cancel();
			return (result == 0) ? true : false;
		} catch (SQLException error) {
			System.out.println(error.getMessage());
			return false;
		}
	}
	
	// 新會員資料寫入資料庫
	public int signupMember(MemberData memberData) {
		
		
		String query = "INSERT INTO `member` (`name`, `password`, `email`, `phone`, `address_1`, `address_2`, `city`, `zip_code`, `creatime`, `country`) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		// 項目創建時間，需使用 MySQL date 不能使用 java date，格式不同
		java.sql.Date createDate = new java.sql.Date(new java.util.Date().getTime());
		
		try {
			PreparedStatement statement = conn.prepareStatement(query,
			        Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, memberData.getName());
			statement.setString(2, memberData.getPassword());
			statement.setString(3, memberData.getEmail());
			statement.setString(4, memberData.getPhone());
			statement.setString(5, memberData.getAddress1());
			statement.setString(6, memberData.getAddress2());
			statement.setString(7, memberData.getCity());
			statement.setString(8, memberData.getZipCode());
			statement.setDate(9, createDate);
			statement.setString(10, memberData.getCountryCode());
			statement.execute();
			
			ResultSet resultSet = statement.getGeneratedKeys();
			int generatedKey = 0;
			if (resultSet.next()) {
			    generatedKey = resultSet.getInt(1);
			}
			resultSet.close();
			statement.close();
			return generatedKey;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
		
		
//		String INSERT_USERS_SQL = "INSERT INTO member" + "(name,password,email)" + "VALUES(?,?,?);";
//
//		int result = 0;
//
//		Class.forName("com.mysql.jdbc.Driver");
//
//		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gaintcat?useSSL=false",
//				"root", "8888");
//
//				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
//
//			preparedStatement.setInt(1, 1);
//			preparedStatement.setString(2, member.getName());
//			preparedStatement.setString(3, member.getPassword());
//			preparedStatement.setString(4, member.getEmail());
//
//			System.out.println(preparedStatement);
//			result = preparedStatement.executeUpdate();
//
//		} catch (SQLException e) {
//
//			printSQLException(e);
//
//		}
//		return result;
	}

//	private void printSQLException(SQLException ex) {
//		for (Throwable e : ex) {
//			if (e instanceof SQLException) {
//				e.printStackTrace(System.err);
//				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
//				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
//				System.err.println("Message: " + e.getMessage());
//				Throwable t = ex.getCause();
//				while (t != null) {
//					System.out.println("Cause: " + t);
//					t = t.getCause();
//				}
//			}
//		}
//	}
}