package bean;

import java.util.ArrayList;

public class ProductListShow {
	private int totalPage;
	private int totalRow;
	private ArrayList<ProductListData> products;
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public ArrayList<ProductListData> getProducts() {
		return products;
	}
	public void setProducts(ArrayList<ProductListData> products) {
		this.products = products;
	}
}
