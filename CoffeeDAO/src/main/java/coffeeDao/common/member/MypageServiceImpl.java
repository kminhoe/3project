package coffeeDao.common.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.LikeBean;
import coffeeDao.model.MemberBean;
import coffeeDao.model.OrderBean;


@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> detailMember(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = memberDAO.detailMember(map);
		return resultMap;
	}

	@Override
	public void updateMember(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		memberDAO.updateMember(map);

	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.deleteMember(map);
		
	}

	@Override
	public List<Map<String, Object>> memberList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return memberDAO.memberList(map);
	}

	@Override
	public int countMember(String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("KEYWORD", "%" + keyword + "%");
		
		return memberDAO.countMember(map);
	}

	@Override
	public List<Map<String, Object>> orderHistory(MemberBean memberBean) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("MEM_ID", memberBean.getMEM_ID()); // 아이디
		map.put("DATE_START", memberBean.getDATE_START()); // 주문 조회 시작 날짜
		map.put("DATE_END", memberBean.getDATE_END()); // 주문 조회 끝 날짜
		
		return memberDAO.orderHistory(map);
	}

	@Override
	public void orderState(OrderBean orderBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("ORDER_ID", orderBean.getORDER_ID()); // 주문 번호
		map.put("ORDER_STATE", orderBean.getORDER_STATE()); // 주문 상태
		
		memberDAO.orderState(map);
	}

	@Override
	public List<Map<String, Object>> myReview(OrderBean orderBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ORDER_ID", orderBean.getORDER_ID());
		
		return memberDAO.myReview(map);
	}

	@Override
	public List<Map<String, Object>> myPutLike(LikeBean likeBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("UP_MEM", likeBean.getUP_MEM());
		
		return memberDAO.myPutLike(map);
	}
}
