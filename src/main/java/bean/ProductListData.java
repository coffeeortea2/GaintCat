package bean;

import java.math.BigDecimal;

public class ProductListData {
	private int id;
	private String title;
	private BigDecimal price;
	private BigDecimal vip_discount;
	private String small_img;	
	public ProductListData() {}
	public ProductListData(int id, String title, BigDecimal price, BigDecimal vip_discount, String small_img) {
		this.id = id;
		this.title = title;
		this.price = price;
		this.vip_discount = vip_discount;
		this.small_img = small_img;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getVip_discount() {
		return vip_discount;
	}
	public void setVip_discount(BigDecimal vip_discount) {
		this.vip_discount = vip_discount;
	}
//	public String getSmallImages() {
//		return smallImages;
//	}
//	public void setSmallImages(String smallImages) {
//		this.smallImages = smallImages;
//	}
	public String getSmall_img() {
		return small_img;
	}
	public void setSmall_img(String small_img) {
		this.small_img = small_img;
	}
	
}
