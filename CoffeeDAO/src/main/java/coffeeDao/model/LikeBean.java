package coffeeDao.model;

public class LikeBean {
	
	private int UP_ID; //상품 일련번호
	private int UP_COUNT; //찜 하면 1 아니면 0
	private String UP_MEM; // 회원 아이디
	private String existence; //Like 유무
	
	
	
	public String getExistence() {
		return existence;
	}
	public void setExistence(String existence) {
		this.existence = existence;
	}
	public int getUP_ID() {
		return UP_ID;
	}
	public void setUP_ID(int uP_ID) {
		UP_ID = uP_ID;
	}
	public int getUP_COUNT() {
		return UP_COUNT;
	}
	public void setUP_COUNT(int uP_COUNT) {
		UP_COUNT = uP_COUNT;
	}
	public String getUP_MEM() {
		return UP_MEM;
	}
	public void setUP_MEM(String uP_MEM) {
		UP_MEM = uP_MEM;
	}
	
	

}
