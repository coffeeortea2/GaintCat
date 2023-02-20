package bean;

public class MemberData {
	private String name;
	private String email;
	private String password;
	private String phone;
	private String address1;
	private String address2;
	private String countryCode;
	private String city;
	private String zipCode;
	public MemberData() {}
	public MemberData(String name, String email, String password, String phone, String address1, String address2,
			String countryCode, String city, String zipCode) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address1 = address1;
		this.address2 = address2;
		this.countryCode = countryCode;
		this.city = city;
		this.zipCode = zipCode;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
}
