package coffeeDao.model;

import java.util.List;

public class CartBean {

	private int CART_IDX; // 장바구니 일련번호
	private String CART_NAME; // 상품 이름
	private int CART_ID; // 상품 코드
	private int CART_PRICE; // 상품 가격
	private String CART_CHECK; // 상품 선택
	private String CART_MEM; // 주문자 회원 아이디
	private int CART_COUNT; // 상품 개수
	private int CART_TOT; // 상품 총 가격
	private String CART_GRIND; //상품 분쇄도
	private int ITEM_200; //가격 200g
	private int ITEM_500; // 가격 500g
	private List<CartBean> cartBeanList;
	private String ITEM_SELLER;
	private String ITEM_IMAGE; //상품 이미지
	
	
	


	public String getITEM_IMAGE() {
		return ITEM_IMAGE;
	}

	public void setITEM_IMAGE(String iTEM_IMAGE) {
		ITEM_IMAGE = iTEM_IMAGE;
	}

	public String getITEM_SELLER() {
		return ITEM_SELLER;
	}

	public void setITEM_SELLER(String iTEM_SELLER) {
		ITEM_SELLER = iTEM_SELLER;
	}

	public int getITEM_200() {
		return ITEM_200;
	}

	public void setITEM_200(int iTEM_200) {
		ITEM_200 = iTEM_200;
	}

	public int getITEM_500() {
		return ITEM_500;
	}

	public void setITEM_500(int iTEM_500) {
		ITEM_500 = iTEM_500;
	}

	public String getCART_GRIND() {
		return CART_GRIND;
	}

	public void setCART_GRIND(String cART_GRIND) {
		CART_GRIND = cART_GRIND;
	}





	public List<CartBean> getCartBeanList() {
		return cartBeanList;
	}

	public void setCartBeanList(List<CartBean> cartBeanList) {
		this.cartBeanList = cartBeanList;
	}

	public int getCART_IDX() {
		return CART_IDX;
	}

	public void setCART_IDX(int cART_IDX) {
		CART_IDX = cART_IDX;
	}

	public String getCART_NAME() {
		return CART_NAME;
	}

	public void setCART_NAME(String cART_NAME) {
		CART_NAME = cART_NAME;
	}

	public int getCART_ID() {
		return CART_ID;
	}

	public void setCART_ID(int cART_ID) {
		CART_ID = cART_ID;
	}

	public int getCART_PRICE() {
		return CART_PRICE;
	}

	public void setCART_PRICE(int cART_PRICE) {
		CART_PRICE = cART_PRICE;
	}

	public String getCART_CHECK() {
		return CART_CHECK;
	}

	public void setCART_CHECK(String cART_CHECK) {
		CART_CHECK = cART_CHECK;
	}

	public String getCART_MEM() {
		return CART_MEM;
	}

	public void setCART_MEM(String cART_MEM) {
		CART_MEM = cART_MEM;
	}

	public int getCART_COUNT() {
		return CART_COUNT;
	}

	public void setCART_COUNT(int cART_COUNT) {
		CART_COUNT = cART_COUNT;
	}

	public int getCART_TOT() {
		return CART_TOT;
	}

	public void setCART_TOT(int cART_TOT) {
		CART_TOT = cART_TOT;
	}

}