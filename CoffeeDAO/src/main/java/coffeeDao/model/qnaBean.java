package coffeeDao.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class qnaBean {
	
	private int QA_IDX;
	private Date QA_DATE;
	private String QA_CLASS;
	private String QA_TITLE;
	private String QA_CONT;
	private String QA_WRITER;
	private String QA_STATE;
	private String QA_IMAGE;
	private MultipartFile QA_FILE;
	private String QA_DEL;
	
	
	
	
	
	
	
	public String getQA_IMAGE() {
		return QA_IMAGE;
	}
	public void setQA_IMAGE(String qA_IMAGE) {
		QA_IMAGE = qA_IMAGE;
	}
	public MultipartFile getQA_FILE() {
		return QA_FILE;
	}
	public void setQA_FILE(MultipartFile qA_FILE) {
		QA_FILE = qA_FILE;
	}
	
	
	
	
	
	public int getQA_IDX() {
		return QA_IDX;
	}
	public void setQA_IDX(int qA_IDX) {
		QA_IDX = qA_IDX;
	}
	public Date getQA_DATE() {
		return QA_DATE;
	}
	public void setQA_DATE(Date qA_DATE) {
		QA_DATE = qA_DATE;
	}
	public String getQA_CLASS() {
		return QA_CLASS;
	}
	public void setQA_CLASS(String qA_CLASS) {
		QA_CLASS = qA_CLASS;
	}
	public String getQA_TITLE() {
		return QA_TITLE;
	}
	public void setQA_TITLE(String qA_TITLE) {
		QA_TITLE = qA_TITLE;
	}
	public String getQA_CONT() {
		return QA_CONT;
	}
	public void setQA_CONT(String qA_CONT) {
		QA_CONT = qA_CONT;
	}
	public String getQA_WRITER() {
		return QA_WRITER;
	}
	public void setQA_WRITER(String qA_WRITER) {
		QA_WRITER = qA_WRITER;
	}
	public String getQA_STATE() {
		return QA_STATE;
	}
	public void setQA_STATE(String qA_STATE) {
		QA_STATE = qA_STATE;
	}
	
	public String getQA_DEL() {
		return QA_DEL;
	}
	public void setQA_DEL(String qA_DEL) {
		QA_DEL = qA_DEL;
	}
	
	

}
