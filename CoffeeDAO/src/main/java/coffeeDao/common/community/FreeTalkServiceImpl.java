package coffeeDao.common.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.CommentBean;
import coffeeDao.model.FreeTalkBean;

@Service("freeTalkService")
public class FreeTalkServiceImpl implements FreeTalkService{

	@Resource(name = "freeTalkDAO")
	private FreeTalkDAO freeTalkDAO;
	
	@Override
	public List<Map<String, Object>> freeTalkList(PagingVO pagingVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("BO_TYPE", pagingVO.getType());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return freeTalkDAO.freeTalkList(map);
	}

	@Override
	public int countBoard(String type, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("BO_TYPE", type);
		map.put("KEYWORD", "%" + keyword + "%");
		
		return freeTalkDAO.countBoard(map);
	}

	@Override
	public void freeTalkWrite(FreeTalkBean freeTalkBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("BO_TITLE", freeTalkBean.getBO_TITLE());
		map.put("BO_MEMID", freeTalkBean.getBO_MEMID());
		map.put("BO_COUNT", freeTalkBean.getBO_COUNT() );
		map.put("BO_IMAGE", freeTalkBean.getBO_IMAGE());
		map.put("BO_CONT", freeTalkBean.getBO_CONT());
		map.put("BO_TYPE", freeTalkBean.getBO_TYPE());
		
		freeTalkDAO.freeTalkWrite(map);
	}

	@Override
	public Map<String, Object> freeTalkDetail(FreeTalkBean freeTalkBean) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("BO_COUNT", freeTalkBean.getBO_COUNT());
		map.put("BO_IDX", freeTalkBean.getBO_IDX());
		freeTalkDAO.updateCount(map);
		
		return freeTalkDAO.freeTalkDetail(map);
	}

	@Override
	public void freeTalkModify(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		freeTalkDAO.freeTalkModify(map);
	}

	@Override
	public List<Map<String, Object>> adminList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("BO_TYPE", pagingVO.getType());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return freeTalkDAO.freeTalkList(map);
	}

	@Override
	public void noticeWrite(FreeTalkBean freeTalkBean) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("BO_TITLE", freeTalkBean.getBO_TITLE());
		map.put("BO_MEMID", freeTalkBean.getBO_MEMID());
		map.put("BO_COUNT", freeTalkBean.getBO_COUNT() );
		map.put("BO_IMAGE", freeTalkBean.getBO_IMAGE());
		map.put("BO_CONT", freeTalkBean.getBO_CONT());
		map.put("BO_TYPE", freeTalkBean.getBO_TYPE());
		
		freeTalkDAO.noticeWrite(map);
	}

	@Override
	public void freeTalkDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		freeTalkDAO.freeTalkDelete(map);
	}
	
	//Comments 
	
	@Override
	public List<Map<String, Object>> commentList(int idx) throws Exception {
		return freeTalkDAO.commentList(idx);
	}

	@Override
	public int insertComment(CommentBean commentBean) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("COM_ARTNO", commentBean.getCOM_ARTNO());
		map.put("COM_IDX", commentBean.getCOM_IDX());
		map.put("COM_WRITER", commentBean.getCOM_WRITER());
		map.put("COM_CONT", commentBean.getCOM_CONT());
		map.put("COM_REF", commentBean.getCOM_REF());
		map.put("COM_STEP", commentBean.getCOM_STEP());
		map.put("COM_LEVEL", commentBean.getCOM_LEVEL());
		
		return freeTalkDAO.insertComment(map);
	}

	@Override
	public int countRef(CommentBean commentBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("COM_REF", commentBean.getCOM_REF());
		
		return freeTalkDAO.countRef(map);
	}

	@Override
	public void updateRestep(CommentBean commentBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("COM_REF", commentBean.getCOM_REF());
		map.put("COM_STEP", commentBean.getCOM_STEP());
		
		freeTalkDAO.updateRestep(map);
	}

	@Override
	public Long getMaxIdx() throws Exception {

		return freeTalkDAO.getMaxIdx();
	}
	
	@Override
	public void updateComment(Map<String, Object> map) throws Exception {
		freeTalkDAO.updateComment(map);
	}

	@Override
	public void deleteComment(int COM_IDX) throws Exception {
		freeTalkDAO.deleteComment(COM_IDX);
	}

}
