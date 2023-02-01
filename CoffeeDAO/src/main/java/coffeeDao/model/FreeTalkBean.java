package coffeeDao.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FreeTalkBean {

	private int BO_IDX;
	private String BO_TITLE;
	private Date BO_DATE;
	private String BO_MEMID;
	private int BO_COUNT;
	private String BO_CONT;
	private String BO_IMAGE;
	private int BO_DEL;
	private String BO_TYPE;
	private MultipartFile BO_IMAGE_FILE;
	
	public int getBO_IDX() {
		return BO_IDX;
	}
	public void setBO_IDX(int bO_IDX) {
		BO_IDX = bO_IDX;
	}
	public String getBO_TITLE() {
		return BO_TITLE;
	}
	public void setBO_TITLE(String bO_TITLE) {
		BO_TITLE = bO_TITLE;
	}
	public Date getBO_DATE() {
		return BO_DATE;
	}
	public void setBO_DATE(Date bO_DATE) {
		BO_DATE = bO_DATE;
	}
	public String getBO_MEMID() {
		return BO_MEMID;
	}
	public void setBO_MEMID(String bO_MEMID) {
		BO_MEMID = bO_MEMID;
	}
	public int getBO_COUNT() {
		return BO_COUNT;
	}
	public void setBO_COUNT(int bO_COUNT) {
		BO_COUNT = bO_COUNT;
	}
	public String getBO_CONT() {
		return BO_CONT;
	}
	public void setBO_CONT(String bO_CONT) {
		BO_CONT = bO_CONT;
	}
	public String getBO_IMAGE() {
		return BO_IMAGE;
	}
	public void setBO_IMAGE(String bO_IMAGE) {
		BO_IMAGE = bO_IMAGE;
	}
	public MultipartFile getBO_IMAGE_FILE() {
		return BO_IMAGE_FILE;
	}
	public void setBO_IMAGE_FILE(MultipartFile bO_IMAGE_FILE) {
		BO_IMAGE_FILE = bO_IMAGE_FILE;
	}
	public int getBO_DEL() {
		return BO_DEL;
	}
	public void setBO_DEL(int bO_DEL) {
		BO_DEL = bO_DEL;
	}
	public String getBO_TYPE() {
		return BO_TYPE;
	}
	public void setBO_TYPE(String bO_TYPE) {
		BO_TYPE = bO_TYPE;
	}
}
