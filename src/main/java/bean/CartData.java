package bean;

import java.math.BigDecimal;

public class CartData {
	private int productId;
	private String title;
	private int quantity;
	private int inventory;
	private BigDecimal price;
	private String small_img;
	public CartData() {}
	public CartData(int productId, String title, int quantity, BigDecimal price, String small_img) {
		this.productId = productId;
		this.title = title;
		this.quantity = quantity;
		this.price = price;
		this.small_img = small_img;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
//	public String getSmallImage() {
//		return smallImage;
//	}
//	public void setSmallImage(String smallImage) {
//		this.smallImage = smallImage;
//	}
	public String getSmall_img() {
		return small_img;
	}
	public void setSmall_img(String small_img) {
		this.small_img = small_img;
	}	
}
