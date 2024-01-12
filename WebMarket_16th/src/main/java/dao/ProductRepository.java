package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	//상품 목록을 저장하기 위한 Product 객체타입의 배열생성
	private static ProductRepository instance = new ProductRepository();
	//ProductRepository 타입의 객체 생성
	public static ProductRepository getInstance() {
		return instance;
	}
	//ProductRepository 타입의 객체를 얻는 메소드 생성
	
	public ProductRepository() {
		super();
		
		
		Product phone = new Product("P1234","iPhone 6s",800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");//이미지 파일명 저장
		phone.setQuantity(0);

		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");//이미지 파일명 저장
		notebook.setQuantity(0);

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");//이미지 파일명 저장
		tablet.setQuantity(0);
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById; //매개변수에 넣은 제품아이디와 일치하는 제품객체를 리턴
	}
	
	//ProductRepository 클래스에 하나의 제품에 대한 다양한 정보를 제품정보 리스트에 추가할 addProduct()메소드 생성
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
















