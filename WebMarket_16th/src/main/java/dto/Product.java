package dto;

import java.io.Serializable;

public class Product implements Serializable{ //자바빈즈
	//객체의 직렬화를 위해 Serializable 인터페이스를 구현
	
	private String productId; //상품 아이디
	private String pname; //상품명
	private int unitPrice; //상품가격
	private String description; //상품설명
	private String manufacturer; //제조사
	private String category; //분류
	private long unitsInStock; //재고수
	private String condition; //상품상태 (신상품, 중고품, 재생품)
	private int quantity; //장바구니에 담은 개수
	//이미지 파일명
	private String filename;
	
	public Product() {
		super();
	}

	public Product(String productId, String pname, int unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public String getPname() {
		return pname;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public String getFilename() {
		return filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
