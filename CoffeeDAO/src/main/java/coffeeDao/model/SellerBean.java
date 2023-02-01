package coffeeDao.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SellerBean {
	private String SELL_ID; // 아이디
	private String SELL_PWD; // 비밀번호
	private String SELL_NUM; // 사입자 번호
	private String SELL_NAME; // 업체명
	private String SELL_PHONE; // 전화번호
	private String SELL_ADDR1; // 주소
	private String SELL_ADDR2; // 상세 주소
	private String SELL_ZP; // 우편번호
	private String SELL_EMAIL; // 이메일
	private String SELL_BANK; // 은행
	private String SELL_IMAGE; // 회사 이미지
	private String SELL_PROF; // 회사 로고 이미지
	private String SELL_CONT; // 회사 상세 내용
	private String SELL_BNUM; // 계좌 번호
	private String SELL_SNS; // 소셜 아이디
	private Number SELL_STATE; // 회원 상태
	private MultipartFile SELL_PROF_UPLOADFILE; // 로고 업로드 파일
	private List<MultipartFile> SELL_IMAGE_UPLOADFILE; // 업체 이미지 업로드 파일
	private Date SELL_RDATE;
	
	
	public String getSELL_ID() {
		return SELL_ID;
	}
	public void setSELL_ID(String sELL_ID) {
		SELL_ID = sELL_ID;
	}
	public String getSELL_PWD() {
		return SELL_PWD;
	}
	public void setSELL_PWD(String sELL_PWD) {
		SELL_PWD = sELL_PWD;
	}
	public String getSELL_NUM() {
		return SELL_NUM;
	}
	public void setSELL_NUM(String sELL_NUM) {
		SELL_NUM = sELL_NUM;
	}
	public String getSELL_NAME() {
		return SELL_NAME;
	}
	public void setSELL_NAME(String sELL_NAME) {
		SELL_NAME = sELL_NAME;
	}
	public String getSELL_PHONE() {
		return SELL_PHONE;
	}
	public void setSELL_PHONE(String sELL_PHONE) {
		SELL_PHONE = sELL_PHONE;
	}
	public String getSELL_ADDR1() {
		return SELL_ADDR1;
	}
	public void setSELL_ADDR1(String sELL_ADDR1) {
		SELL_ADDR1 = sELL_ADDR1;
	}
	public String getSELL_ADDR2() {
		return SELL_ADDR2;
	}
	public void setSELL_ADDR2(String sELL_ADDR2) {
		SELL_ADDR2 = sELL_ADDR2;
	}
	public String getSELL_ZP() {
		return SELL_ZP;
	}
	public void setSELL_ZP(String sELL_ZP) {
		SELL_ZP = sELL_ZP;
	}
	public String getSELL_EMAIL() {
		return SELL_EMAIL;
	}
	public void setSELL_EMAIL(String sELL_EMAIL) {
		SELL_EMAIL = sELL_EMAIL;
	}
	public String getSELL_BANK() {
		return SELL_BANK;
	}
	public void setSELL_BANK(String sELL_BANK) {
		SELL_BANK = sELL_BANK;
	}

	public String getSELL_IMAGE() {
		return SELL_IMAGE;
	}
	public void setSELL_IMAGE(String sELL_IMAGE) {
		SELL_IMAGE = sELL_IMAGE;
	}
	public String getSELL_PROF() {
		return SELL_PROF;
	}
	public void setSELL_PROF(String sELL_PROF) {
		SELL_PROF = sELL_PROF;
	}
	public String getSELL_CONT() {
		return SELL_CONT;
	}
	public void setSELL_CONT(String sELL_CONT) {
		SELL_CONT = sELL_CONT;
	}
	public String getSELL_BNUM() {
		return SELL_BNUM;
	}
	public void setSELL_BNUM(String sELL_BNUM) {
		SELL_BNUM = sELL_BNUM;
	}
	public String getSELL_SNS() {
		return SELL_SNS;
	}
	public void setSELL_SNS(String sELL_SNS) {
		SELL_SNS = sELL_SNS;
	}
	public Number getSELL_STATE() {
		return SELL_STATE;
	}
	public void setSELL_STATE(Number sELL_STATE) {
		SELL_STATE = sELL_STATE;
	}
	public MultipartFile getSELL_PROF_UPLOADFILE() {
		return SELL_PROF_UPLOADFILE;
	}
	public void setSELL_PROF_UPLOADFILE(MultipartFile sELL_PROF_UPLOADFILE) {
		SELL_PROF_UPLOADFILE = sELL_PROF_UPLOADFILE;
	}
	public List<MultipartFile> getSELL_IMAGE_UPLOADFILE() {
		return SELL_IMAGE_UPLOADFILE;
	}
	public void setSELL_IMAGE_UPLOADFILE(List<MultipartFile> sELL_IMAGE_UPLOADFILE) {
		SELL_IMAGE_UPLOADFILE = sELL_IMAGE_UPLOADFILE;
	}
	public Date getSELL_RDATE() {
		return SELL_RDATE;
	}
	public void setSELL_RDATE(Date sELL_RDATE) {
		SELL_RDATE = sELL_RDATE;
	}
	
	
}