package bean;

public class ChildCategory {
//	private int childId;
//	private int parentId;
	private int id;
	private int parent_id;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	// public int getChildId() {
//		return childId;
//	}
//	public void setChildId(int childId) {
//		this.childId = childId;
//	}
//	public int getParentId() {
//		return parentId;
//	}
//	public void setParentId(int parentId) {
//		this.parentId = parentId;
//	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
