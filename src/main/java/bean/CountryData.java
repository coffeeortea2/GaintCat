package bean;

public class CountryData {
	private int id;
	private String countryName;
	private String countryCode;
	private String region;
	public CountryData() {}
	public CountryData(int id, String countryName, String countryCode, String region) {
		super();
		this.id = id;
		this.countryName = countryName;
		this.countryCode = countryCode;
		this.region = region;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
}
