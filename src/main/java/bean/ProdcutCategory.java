package bean;

import java.util.ArrayList;

public class ProdcutCategory {
	private int id;
	private String name;
	private ArrayList<ChildCategory> childCategories;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<ChildCategory> getChildCategories() {
		return childCategories;
	}
	public void setChildCategories(ArrayList<ChildCategory> childCategories) {
		this.childCategories = childCategories;
	}
}
