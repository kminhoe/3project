package coffeeDao.model;

import java.util.Date;

public class MemberBean {
	private String MEM_ID; // 아이디
	private String MEM_PWD; // 비밀번호
	private String MEM_NAME; // 이름
	private Date MEM_RDATE;
	private String MEM_EMAIL; // 이메일
	private String MEM_ADDR1; // 주소
	private String MEM_ADDR2; // 주소 상세
	private String MEM_ZP; // 우편번호
	private String MEM_PHONE; // 전화번호
	private Number MEM_DEL;
	
	private String DATE_START; // 날짜 시작
	private String DATE_END; // 날짜 종료
	
	public Date getMEM_RDATE() {
		return MEM_RDATE;
	}
	public void setMEM_RDATE(Date mEM_RDATE) {
		MEM_RDATE = mEM_RDATE;
	}
	public Number getMEM_DEL() {
		return MEM_DEL;
	}
	public void setMEM_DEL(Number mEM_DEL) {
		MEM_DEL = mEM_DEL;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getMEM_PWD() {
		return MEM_PWD;
	}
	public void setMEM_PWD(String mEM_PWD) {
		MEM_PWD = mEM_PWD;
	}
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}
	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}
	public void setMEM_EMAIL(String mEM_EMAIL) {
		MEM_EMAIL = mEM_EMAIL;
	}
	public String getMEM_ADDR1() {
		return MEM_ADDR1;
	}
	public void setMEM_ADDR1(String mEM_ADDR1) {
		MEM_ADDR1 = mEM_ADDR1;
	}
	public String getMEM_ADDR2() {
		return MEM_ADDR2;
	}
	public void setMEM_ADDR2(String mEM_ADDR2) {
		MEM_ADDR2 = mEM_ADDR2;
	}
	public String getMEM_ZP() {
		return MEM_ZP;
	}
	public void setMEM_ZP(String mEM_ZP) {
		MEM_ZP = mEM_ZP;
	}
	public String getMEM_PHONE() {
		return MEM_PHONE;
	}
	public void setMEM_PHONE(String mEM_PHONE) {
		MEM_PHONE = mEM_PHONE;
	}
	public String getDATE_START() {
		return DATE_START;
	}
	public void setDATE_START(String dATE_START) {
		DATE_START = dATE_START;
	}
	public String getDATE_END() {
		return DATE_END;
	}
	public void setDATE_END(String dATE_END) {
		DATE_END = dATE_END;
	}
}
