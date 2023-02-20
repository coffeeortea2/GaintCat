<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%
String name= request.getParameter("name");
String password= request.getParameter("password");
String email= request.getParameter("email");
String address_1= request.getParameter("address_1");
String address_2= request.getParameter("address_2");
String city= request.getParameter("city");
String zip_code= request.getParameter("zip_code");
String country= request.getParameter("country");
try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:9080/gaintcat?useUnicode=true&characterEncoding=UTF-8", "root", "123456");
  Statement st=conn.createStatement();
  int i=st.executeUpdate("INSERT INTO member(name,password,email,address_1,address_2,city,zip_code,country)VALUES('"+name+"','"+password+"','"+email+"','"+address_1+"','"+address_2+"','"+city+"','"+zip_code+"','"+country+"')");
  out.println("Data is successfully inserted!");
}catch(Exception e){
	System.out.print(e);
  e.printStackTrace();
}
%>