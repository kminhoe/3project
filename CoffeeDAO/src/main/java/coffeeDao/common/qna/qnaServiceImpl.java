package coffeeDao.common.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.qnaBean;

@Service("qnaService")
public class qnaServiceImpl implements qnaService{

	@Resource(name = "qnaDAO")
	private qnaDAO qnaDAO;
	
	@Override
	public List<Map<String, Object>> adminList(PagingVO pagingVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return qnaDAO.adminList(map);
	}

	@Override
	public Map<String, Object> adminQnaDetail(qnaBean qnaBean) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("QA_IDX", qnaBean.getQA_IDX());
		
		return qnaDAO.adminQnaDetail(map); 
	}

	@Override
	public void adminQnaReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.adminQnaReply(map);	
	}
	
	public void adminQnaDelete(Map<String,Object> map) throws Exception {
		qnaDAO.adminQnaDelete(map);
	}

}
