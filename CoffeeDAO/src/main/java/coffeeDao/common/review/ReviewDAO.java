package coffeeDao.common.review;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 장바구니 담기(생성)
	public void insertReview(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("review.insertReview", map);
	}
	
	public void deleteReview(int RE_IDX) throws Exception{
		sqlSessionTemplate.delete("review.deleteReview", RE_IDX);
	}

}
