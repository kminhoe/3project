package coffeeDao.model;

import java.util.Date;
import java.util.List;

public class OrderBean {

	private int ORDER_IDX;
	private String ORDER_ID;
	private int ORDER_CART;
	private String ORDER_MEM;
	private String ORDER_NAME;
	private Date ORDER_DATE;
	private int ORDER_NO;
	private String ORDER_ITEM;
	private int ORDER_COUNT;
	private int ORDER_PRICE;
	private int ORDER_TOT;
	private String ORDER_PHONE;
	private String ORDER_ZP;
	private String ORDER_ADDR1;
	private String ORDER_ADDR2;
	private String ORDER_HOLDER;
	private String ORDER_BANK;
	private String ORDER_ACCNO;
	private String ORDER_BILL;
	private String ORDER_STATE;
	private String ORDER_SENDNO;
	private String ORDER_SELLER;
	private String ORDER_MEMO;
	private String ORDER_SUB;
	private String ORDER_GRIND;
	private String PRICE; //가짜데이터
	private List<OrderBean> orderBeanList;
	private int SIZE; //가짜데이터
	private String ORDER_IMAGE; //가짜 데이터
	
	
	
	public String getORDER_IMAGE() {
		return ORDER_IMAGE;
	}
	public void setORDER_IMAGE(String oRDER_IMAGE) {
		ORDER_IMAGE = oRDER_IMAGE;
	}
	public int getSIZE() {
		return SIZE;
	}
	public void setSIZE(int sIZE) {
		SIZE = sIZE;
	}
	public List<OrderBean> getOrderBeanList() {
		return orderBeanList;
	}
	public void setOrderBeanList(List<OrderBean> orderBeanList) {
		this.orderBeanList = orderBeanList;
	}
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	public String getORDER_GRIND() {
		return ORDER_GRIND;
	}
	public void setORDER_GRIND(String oRDER_GRIND) {
		ORDER_GRIND = oRDER_GRIND;
	}
	public int getORDER_IDX() {
		return ORDER_IDX;
	}
	public String getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_IDX(int oRDER_IDX) {
		ORDER_IDX = oRDER_IDX;
	}
	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public int getORDER_CART() {
		return ORDER_CART;
	}
	public void setORDER_CART(int oRDER_CART) {
		ORDER_CART = oRDER_CART;
	}
	public String getORDER_MEM() {
		return ORDER_MEM;
	}
	public void setORDER_MEM(String oRDER_MEM) {
		ORDER_MEM = oRDER_MEM;
	}
	public String getORDER_NAME() {
		return ORDER_NAME;
	}
	public void setORDER_NAME(String oRDER_NAME) {
		ORDER_NAME = oRDER_NAME;
	}
	public Date getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(Date oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public int getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public String getORDER_ITEM() {
		return ORDER_ITEM;
	}
	public void setORDER_ITEM(String oRDER_ITEM) {
		ORDER_ITEM = oRDER_ITEM;
	}
	public int getORDER_COUNT() {
		return ORDER_COUNT;
	}
	public void setORDER_COUNT(int oRDER_COUNT) {
		ORDER_COUNT = oRDER_COUNT;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public int getORDER_TOT() {
		return ORDER_TOT;
	}
	public void setORDER_TOT(int oRDER_TOT) {
		ORDER_TOT = oRDER_TOT;
	}
	public String getORDER_PHONE() {
		return ORDER_PHONE;
	}
	public void setORDER_PHONE(String oRDER_PHONE) {
		ORDER_PHONE = oRDER_PHONE;
	}
	public String getORDER_ZP() {
		return ORDER_ZP;
	}
	public void setORDER_ZP(String oRDER_ZP) {
		ORDER_ZP = oRDER_ZP;
	}
	public String getORDER_ADDR1() {
		return ORDER_ADDR1;
	}
	public void setORDER_ADDR1(String oRDER_ADDR1) {
		ORDER_ADDR1 = oRDER_ADDR1;
	}
	public String getORDER_ADDR2() {
		return ORDER_ADDR2;
	}
	public void setORDER_ADDR2(String oRDER_ADDR2) {
		ORDER_ADDR2 = oRDER_ADDR2;
	}
	public String getORDER_HOLDER() {
		return ORDER_HOLDER;
	}
	public void setORDER_HOLDER(String oRDER_HOLDER) {
		ORDER_HOLDER = oRDER_HOLDER;
	}
	public String getORDER_BANK() {
		return ORDER_BANK;
	}
	public void setORDER_BANK(String oRDER_BANK) {
		ORDER_BANK = oRDER_BANK;
	}
	public String getORDER_ACCNO() {
		return ORDER_ACCNO;
	}
	public void setORDER_ACCNO(String oRDER_ACCNO) {
		ORDER_ACCNO = oRDER_ACCNO;
	}
	public String getORDER_BILL() {
		return ORDER_BILL;
	}
	public void setORDER_BILL(String oRDER_BILL) {
		ORDER_BILL = oRDER_BILL;
	}
	public String getORDER_STATE() {
		return ORDER_STATE;
	}
	public void setORDER_STATE(String oRDER_STATE) {
		ORDER_STATE = oRDER_STATE;
	}
	public String getORDER_SENDNO() {
		return ORDER_SENDNO;
	}
	public void setORDER_SENDNO(String oRDER_SENDNO) {
		ORDER_SENDNO = oRDER_SENDNO;
	}
	public String getORDER_SELLER() {
		return ORDER_SELLER;
	}
	public void setORDER_SELLER(String oRDER_SELLER) {
		ORDER_SELLER = oRDER_SELLER;
	}
	public String getORDER_MEMO() {
		return ORDER_MEMO;
	}
	public void setORDER_MEMO(String oRDER_MEMO) {
		ORDER_MEMO = oRDER_MEMO;
	}
	public String getORDER_SUB() {
		return ORDER_SUB;
	}
	public void setORDER_SUB(String oRDER_SUB) {
		ORDER_SUB = oRDER_SUB;
	}
	
}
