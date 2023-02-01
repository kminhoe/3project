package coffeeDao.common.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import coffeeDao.model.qnaBean;

public interface InquiryService {
	
	public List<Map<String, Object>> inquiryList(String id) throws Exception; //리스트
	
	public int count(Criteria cri) throws Exception; //카운트
	
	public List<Map<String, Object>> inquiryListPage(Criteria cri) throws Exception;  //리스트 페이징
	
	public void inquiryWrite(qnaBean qa,HttpSession session, HttpServletRequest request) throws Exception; // 글 작성
	
	public Map<String, Object> inquiryDetail(int idx) throws Exception;//글 상세보기
	
	public void inquiryUpdate(qnaBean qa, HttpSession session, HttpServletRequest request) throws Exception; // 글 수정
	
	public void inquiryDelete(int num) throws Exception; // 글 수정
	
}
