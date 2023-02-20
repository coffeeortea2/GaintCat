package bean;

import java.math.BigDecimal;

public class OrderPriceData {
	private BigDecimal discount;
	private BigDecimal subtotal;
	private BigDecimal shippingCost;
	private BigDecimal total;
	public OrderPriceData() {}
	public OrderPriceData(BigDecimal discount, BigDecimal subtotal, BigDecimal shippingCost, BigDecimal total) {
		this.discount = discount;
		this.subtotal = subtotal;
		this.shippingCost = shippingCost;
		this.total = total;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	public BigDecimal getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}
	public BigDecimal getShippingCost() {
		return shippingCost;
	}
	public void setShippingCost(BigDecimal shippingCost) {
		this.shippingCost = shippingCost;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
}
