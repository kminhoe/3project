package coffeeDao.common.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("qnaDAO")
public class qnaDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("qna.selectAdminList", map);
	}
	
	public Map<String,Object> adminQnaDetail(Map<String,Object>map) throws Exception{
		return sqlSessionTemplate.selectOne("qna.adminQnaDetail", map);
	}
	
	public void adminQnaReply(Map<String,Object> map) throws Exception {
		sqlSessionTemplate.update("qna.adminQnaReply",map);
	}
	
	public void adminQnaDelete(Map<String,Object> map) throws Exception {
		sqlSessionTemplate.update("qna.adminQnaDelete", map);
	}


}
