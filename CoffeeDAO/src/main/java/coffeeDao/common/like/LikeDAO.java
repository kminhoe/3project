package coffeeDao.common.like;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import coffeeDao.common.common.dao.AbstractDAO;

@Repository("likeDAO")
public class LikeDAO extends AbstractDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	// 찜하기
	public void putLike(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("like.putLike", map);
	}

	// 찜하기 유무
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLike(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) sqlSessionTemplate.selectOne("like.selectLike", map);
	}
	
	// 찜 리스트
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> likeList(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("like.likeList", map);
		}
	
	// 찜하기 삭제
		public void deleteLike(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.delete("like.deleteLike", map);
		}
		
		//COUNT
		@SuppressWarnings("unchecked")
		public Map<String, Object> countLike(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) sqlSessionTemplate.selectOne("like.countLike", map);
		}

}
