package bean;

import java.math.BigDecimal;
import java.util.ArrayList;

public class OrderData extends OrderPriceData {
	private int orderId;
	private int memberId;
	private String name;
	private String email;
	private String phone;
	private String address1;
	private String address2;
	private String countryCode;
	private String city;
	private String zipCode;
	private ArrayList<CartData> cartData;
	public OrderData() {}
	public OrderData(int orderId, int memberId, BigDecimal discount, BigDecimal subtotal, BigDecimal shippingCost, BigDecimal total,
			String name, String email, String phone, String address1, String address2, String countryCode,
			String city, String zipCode, ArrayList<CartData> cartData) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address1 = address1;
		this.address2 = address2;
		this.countryCode = countryCode;
		this.city = city;
		this.zipCode = zipCode;
		this.cartData = cartData;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public ArrayList<CartData> getCartData() {
		return cartData;
	}
	public void setCartData(ArrayList<CartData> cartData) {
		this.cartData = cartData;
	}
}
