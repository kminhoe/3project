package coffeeDao.common.member;

import java.util.List;
import java.util.Map;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.LikeBean;
import coffeeDao.model.MemberBean;
import coffeeDao.model.OrderBean;

public interface MypageService {
	
	public Map<String, Object> detailMember(Map<String,Object> map) throws Exception; // 회원수정 - 선택

	public void updateMember(Map<String,Object> map) throws Exception; // 회원수정 - 수정
	
	public void deleteMember(Map<String,Object> map) throws Exception;
	
	public List<Map<String,Object>> memberList(PagingVO pagingVO) throws Exception; // admin member 리스트
	
	public int countMember(String keyword) throws Exception;
	
	public List<Map<String, Object>> orderHistory(MemberBean memberBean) throws Exception; // 일반회원 > 마이페이지 > 주문내역 > 주문조회
	public void orderState(OrderBean orderBean) throws Exception; // 일반회원 > 마이페이지 > 주문내역 > 상태변경 (구매확정)
	public List<Map<String, Object>> myReview(OrderBean orderBean) throws Exception; // 일반회원 > 마이페이지 > 리뷰보기
	public List<Map<String, Object>> myPutLike(LikeBean likeBean) throws Exception; // 일반회원 > 마이페이지 > 찜목록
}
