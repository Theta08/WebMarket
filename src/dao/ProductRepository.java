package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	//상품을 어레이리스트에 저장하는 리스트오브프로덕츠를 생성한다.
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	// 스테틱 객체를 만들어서 새로 입력한 제품이 저장되어 있도록 한다.
	private static ProductRepository instance = new ProductRepository();
	// 한번 만들어진 스테틱 객체 인스턴스를 리턴한다.
	public static ProductRepository getInstance() {
		return instance;
	}
	// 상품 추가하는 메소드
	public void addProduct( Product newProduct) {
		listOfProducts.add(newProduct);
	}
	// 생성자 => 새 상품 아이폰, 그램, 갤럭시 탭의 상품 객체를 생성하여 리스트에 입력
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");

		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	// 어레이리스트는 외부접근불가(private)이기 때문에 접근 가능한 get 메소드 작성
	public ArrayList<Product> getAllProduct(){
		return listOfProducts;
	}
	//상품 상세 정보를 가져오는 메소드(제품 id를 입력)
	public Product getProductById(String productId) {
		
		Product productById = null;
		//제품 리스트에서 제품 아이디로 검사해서 아이디가 같은 제품 객체를 리턴
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId().equals(productId)) {
				productById = product; break;
			}
		}
	
		return productById;
	}
	
	
	
}









