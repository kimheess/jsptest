package mvc.cart;

import java.util.ArrayList;

public class CartBean {
	
	private final String ID = "longlee";	//약속된 id와 pw
	private final String PASSWD = "6789";
	ArrayList<String> productList;	// 장바구니 
	
	public CartBean() {						//CartBean 장바구니 가지고 있음 
		productList = new ArrayList<String>();
	}
	
	public boolean checkLogin(String id,String passwd) { //임의로 정해진 아이디로 로그인 하게 만듬
		boolean result = false;						
		
		//아이디가 null이 아니고 ( 입력 안하고 로그인 버튼만 눌를떄) 패스워드도 널이 아니고 입력값이 맞으면 트루(로그인)
		if(id != null && id.equals(this.ID) && id != null && passwd.equals(this.PASSWD)) {
			result = true;
		}
		
		
		return result;
	}
	
	public ArrayList<String> getProductList() {  //장바구니 
		return this.productList;
	}
	
	public void addProduct(String product) { //장바구니에 상품 추가 기능 
		this.productList.add(product);
	}
	
	public void clearProduct() {  //장바구니 비우기 
		this.productList.clear();
	}
}
