package coffeeDao.common.review;

import coffeeDao.model.ReviewBean;

public interface ReviewService {
	
	public void insertReview(ReviewBean review) throws Exception; // 회원가입
	
	public void deleteReview(int RE_IDX) throws Exception; // 리뷰 삭제

}
