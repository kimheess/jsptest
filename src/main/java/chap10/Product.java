package chap10;

public class Product {

	private String [] productList;
	private int num1;
	private int num2;
	
	public Product() {
		this.productList = new String[]{"item1", "item2", "item3", "item4", "item5"};
		this.num1 = 10;
		this.num2 = 20;
	}
	
	public String[] getProductList(){
		return this.productList;
	}
	
	public int getNum1() {
		return this.num1;
	}
	
	public int getNum2() {
		return this.num2;
	}
}
