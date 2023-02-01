package coffeeDao.common.review;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.ReviewBean;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewBean review) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("RE_ITEM", review.getRE_ITEM());
		map.put("RE_MEM", review.getRE_MEM());
		map.put("RE_SELLER", review.getRE_SELLER());
		map.put("RE_CONTENT", review.getRE_CONTENT());
		map.put("RE_REF", review.getRE_REF());
		map.put("RE_STEP", review.getRE_STEP());
		
		reviewDAO.insertReview(map);
		
	}
	
	@Override
	public void deleteReview(int RE_IDX) throws Exception {
		reviewDAO.deleteReview(RE_IDX);
		
	}

}
