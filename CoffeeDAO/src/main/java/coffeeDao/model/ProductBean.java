package coffeeDao.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	
	private Number ITEM_ID; //상품 코드
	private String ITEM_NAME;
	private String ITEM_IMAGE;
	private Date ITEM_DATE;
	private String ITEM_SELLER;
	private String ITEM_CONT;
	private String ITEM_SUB;
	private String ITEM_COMP;
	private String ITEM_LOC;
	private String ITEM_200;
	private String ITEM_500;
	private String ITEM_CAF;
	private String ITEM_TASTE;
	private String ITEM_TYPE;
	private String ITEM_GRIND;
	private Number ITEM_SEND;
	private Number ITEM_LIKE;
	private String ITEM_DEL;
	private String FILE_STD;
	private String SELL_PROF;
	private List <MultipartFile> ITEM_IMAGE_UPLOAD;
	private int like;
	private int count;
	
	public Number getITEM_ID() {
		return ITEM_ID;
	}
	public void setITEM_ID(Number iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public String getITEM_IMAGE() {
		return ITEM_IMAGE;
	}
	public void setITEM_IMAGE(String iTEM_IMAGE) {
		ITEM_IMAGE = iTEM_IMAGE;
	}
	public Date getITEM_DATE() {
		return ITEM_DATE;
	}
	public void setITEM_DATE(Date iTEM_DATE) {
		ITEM_DATE = iTEM_DATE;
	}
	public String getITEM_SELLER() {
		return ITEM_SELLER;
	}
	public void setITEM_SELLER(String iTEM_SELLER) {
		ITEM_SELLER = iTEM_SELLER;
	}
	public String getITEM_CONT() {
		return ITEM_CONT;
	}
	public void setITEM_CONT(String iTEM_CONT) {
		ITEM_CONT = iTEM_CONT;
	}
	public String getITEM_SUB() {
		return ITEM_SUB;
	}
	public void setITEM_SUB(String iTEM_SUB) {
		ITEM_SUB = iTEM_SUB;
	}
	public String getITEM_COMP() {
		return ITEM_COMP;
	}
	public void setITEM_COMP(String iTEM_COMP) {
		ITEM_COMP = iTEM_COMP;
	}
	public String getITEM_LOC() {
		return ITEM_LOC;
	}
	public void setITEM_LOC(String iTEM_LOC) {
		ITEM_LOC = iTEM_LOC;
	}
	public String getITEM_200() {
		return ITEM_200;
	}
	public void setITEM_200(String iTEM_200) {
		ITEM_200 = iTEM_200;
	}
	public String getITEM_500() {
		return ITEM_500;
	}
	public void setITEM_500(String iTEM_500) {
		ITEM_500 = iTEM_500;
	}
	public String getITEM_CAF() {
		return ITEM_CAF;
	}
	public void setITEM_CAF(String iTEM_CAF) {
		ITEM_CAF = iTEM_CAF;
	}
	public String getITEM_TASTE() {
		return ITEM_TASTE;
	}
	public void setITEM_TASTE(String iTEM_TASTE) {
		ITEM_TASTE = iTEM_TASTE;
	}
	public String getITEM_TYPE() {
		return ITEM_TYPE;
	}
	public void setITEM_TYPE(String iTEM_TYPE) {
		ITEM_TYPE = iTEM_TYPE;
	}
	public String getITEM_GRIND() {
		return ITEM_GRIND;
	}
	public void setITEM_GRIND(String iTEM_GRIND) {
		ITEM_GRIND = iTEM_GRIND;
	}
	public Number getITEM_SEND() {
		return ITEM_SEND;
	}
	public void setITEM_SEND(Number iTEM_SEND) {
		ITEM_SEND = iTEM_SEND;
	}
	public Number getITEM_LIKE() {
		return ITEM_LIKE;
	}
	public void setITEM_LIKE(Number iTEM_LIKE) {
		ITEM_LIKE = iTEM_LIKE;
	}
	public String getITEM_DEL() {
		return ITEM_DEL;
	}
	public void setITEM_DEL(String iTEM_DEL) {
		ITEM_DEL = iTEM_DEL;
	}
	public String getFILE_STD() {
		return FILE_STD;
	}
	public void setFILE_STD(String fILE_STD) {
		FILE_STD = fILE_STD;
	}
	public String getSELL_PROF() {
		return SELL_PROF;
	}
	public void setSELL_PROF(String sELL_PROF) {
		SELL_PROF = sELL_PROF;
	}
	public List <MultipartFile> getITEM_IMAGE_UPLOAD() {
		return ITEM_IMAGE_UPLOAD;
	}
	public void setITEM_IMAGE_UPLOAD(List <MultipartFile> iTEM_IMAGE_UPLOAD) {
		ITEM_IMAGE_UPLOAD = iTEM_IMAGE_UPLOAD;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
