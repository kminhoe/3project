package coffeeDao.common.qna;

import java.util.List;
import java.util.Map;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.qnaBean;

public interface qnaService {
	
	public List<Map<String, Object>> adminList(PagingVO pagingVO) throws Exception;
	
	public Map<String,Object> adminQnaDetail(qnaBean qnaBean) throws Exception;

	public void adminQnaReply(Map<String,Object> map) throws Exception;
	
	public void adminQnaDelete(Map<String,Object> map) throws Exception;
	
}
