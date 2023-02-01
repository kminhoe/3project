package coffeeDao.model;

import java.util.Date;

public class CommentBean {
	private int COM_IDX; // 코멘트 번호
	private int COM_ARTNO; // 게시글 번호
	private String COM_WRITER; // 작성자
	private Date COM_DATE; // 시간
	private String COM_CONT; // 내용
	private Long COM_REF; // 그룹
	private int COM_STEP; // 순서
	private int COM_LEVEL; // 들여쓰기
	
	public int getCOM_IDX() {
		return COM_IDX;
	}
	public void setCOM_IDX(int cOM_IDX) {
		COM_IDX = cOM_IDX;
	}
	public int getCOM_ARTNO() {
		return COM_ARTNO;
	}
	public void setCOM_ARTNO(int cOM_ARTNO) {
		COM_ARTNO = cOM_ARTNO;
	}
	public String getCOM_WRITER() {
		return COM_WRITER;
	}
	public void setCOM_WRITER(String cOM_WRITER) {
		COM_WRITER = cOM_WRITER;
	}
	public Date getCOM_DATE() {
		return COM_DATE;
	}
	public void setCOM_DATE(Date cOM_DATE) {
		COM_DATE = cOM_DATE;
	}
	public String getCOM_CONT() {
		return COM_CONT;
	}
	public void setCOM_CONT(String cOM_CONT) {
		COM_CONT = cOM_CONT;
	}

	public Long getCOM_REF() {
		return COM_REF;
	}
	public void setCOM_REF(Long cOM_REF) {
		COM_REF = cOM_REF;
	}
	public int getCOM_STEP() {
		return COM_STEP;
	}
	public void setCOM_STEP(int cOM_STEP) {
		COM_STEP = cOM_STEP;
	}
	public int getCOM_LEVEL() {
		return COM_LEVEL;
	}
	public void setCOM_LEVEL(int cOM_LEVEL) {
		COM_LEVEL = cOM_LEVEL;
	}

}