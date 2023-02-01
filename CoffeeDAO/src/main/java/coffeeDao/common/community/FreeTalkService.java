package coffeeDao.common.community;

import java.util.List;
import java.util.Map;

import coffeeDao.model.CommentBean;
import coffeeDao.model.FreeTalkBean;

public interface FreeTalkService {

	public List<Map<String, Object>> freeTalkList(PagingVO pagingVO) throws Exception; // 게시글 리스트
	public int countBoard(String type, String keyword) throws Exception; // 게시글 총 갯수
	public void freeTalkWrite(FreeTalkBean freeTalkBean) throws Exception; // 게시글 작성
	public Map<String,Object> freeTalkDetail(FreeTalkBean freeTalkBean) throws Exception; //글 상세
	public void freeTalkModify(Map<String,Object> map) throws Exception;
	public List<Map<String, Object>> adminList(PagingVO pagingVO) throws Exception;
	public void noticeWrite(FreeTalkBean freeTalkBean) throws Exception; 
	public void freeTalkDelete(Map<String,Object> map) throws Exception;
	
	// Comments
	public List<Map<String,Object>> commentList(int idx) throws Exception; // 댓글 불러오기
	public int insertComment(CommentBean commentBean) throws Exception; // 댓글 작성하기
	public int countRef(CommentBean commentBean) throws Exception; // REF 그룹의 총 개수
	public Long getMaxIdx() throws Exception; // IDX 총 개수
	public void updateRestep(CommentBean commentBean) throws Exception; // COM_STEP 1씩 증가
	
	public void updateComment(Map<String, Object> map) throws Exception;
	public void deleteComment(int COM_IDX) throws Exception;
}
