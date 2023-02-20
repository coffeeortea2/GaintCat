package model;

import bean.LoginBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginService {

    public LoginBean validate(String email, String password) {
    	LoginBean loginResult = new LoginBean();
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		// 請自行修改這三個變數的內容
    		String db_url = "jdbc:mysql://localhost:9080/gaintcat?useUnicode=true&characterEncoding=utf-8";
    		String db_user = "root";
    		String db_pass = "123456";
    		Connection connection = DriverManager.getConnection(db_url, db_user, db_pass);
    		
    		String query = "SELECT member_id, name, authority FROM member WHERE email = ? AND password = ?;";
    		PreparedStatement statement = connection.prepareStatement(query);
    		statement.setString(1, email);
    		statement.setString(2, password);
    		ResultSet resultSet = statement.executeQuery();
    		while (resultSet.next()) {
				loginResult.setMemberID(resultSet.getInt("member_id"));
				loginResult.setName(resultSet.getString("name"));
				loginResult.setAuthority(resultSet.getString("authority"));
				loginResult.setEmail(email);
			}
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
		}
//    	Connection conn = DBHelper.getConnection();
//    	
//    	String query = "SELECT member_id, name, authority FROM member WHERE email = ? AND password = ?;";
//    	
//    	LoginBean loginResult = new LoginBean();
//    	
//    	try {
//    		PreparedStatement statement = conn.prepareStatement(query);
//    		statement.setString(1, email);
//    		statement.setString(2, password);
//    		ResultSet resultSet = statement.executeQuery();
//    		while (resultSet.next()) {
//				loginResult.setMemberID(resultSet.getInt("member_id"));
//				loginResult.setName(resultSet.getString("name"));
//				loginResult.setAuthority(resultSet.getString("authority"));
//				loginResult.setEmail(email);
//			}
//    	} catch (SQLException e) {
//    		printSQLException(e);
//		}
    	
    	return loginResult;
    }

//    private void printSQLException(SQLException ex) {
//        for (Throwable e: ex) {
//            if (e instanceof SQLException) {
//                e.printStackTrace(System.err);
//                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
//                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
//                System.err.println("Message: " + e.getMessage());
//                Throwable t = ex.getCause();
//                while (t != null) {
//                    System.out.println("Cause: " + t);
//                    t = t.getCause();
//                }
//            }
//        }
//    }
}