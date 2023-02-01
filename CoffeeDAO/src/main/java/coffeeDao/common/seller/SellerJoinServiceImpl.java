package coffeeDao.common.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.SellerBean;

@Service("sellerJoinService")
public class SellerJoinServiceImpl implements SellerJoinService {

	@Resource(name = "sellerDAO")
	private SellerDAO sellerDAO;
	
	@Override
	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	public Map<String, Object> selectSellerId(SellerBean seller) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SELL_ID", seller.getSELL_ID());
		
		return sellerDAO.selectSellerId(map);
	}

	@Override
	// 회원가입 성공
	public void insertSeller(SellerBean seller) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SELL_ID", seller.getSELL_ID()); // 아이디
		map.put("SELL_PWD", seller.getSELL_PWD()); // 패스워드
		map.put("SELL_NUM", seller.getSELL_NUM()); // 사업자 번호
		map.put("SELL_NAME", seller.getSELL_NAME() ); // 상호명
		map.put("SELL_PHONE", seller.getSELL_PHONE()); // 전화번호
		map.put("SELL_ADDR1", seller.getSELL_ADDR1()); // 주소
		map.put("SELL_ADDR2", seller.getSELL_ADDR2()); // 상세주소
		map.put("SELL_ZP", seller.getSELL_ZP()); // 우편번호
		map.put("SELL_EMAIL", seller.getSELL_EMAIL()); // 이메일
		map.put("SELL_IMAGE", seller.getSELL_IMAGE()); //기업 로고 이미지
		map.put("SELL_PROF", seller.getSELL_PROF()); // 프로필 이미지
		map.put("SELL_CONT", seller.getSELL_CONT()); // 기업 소개
		map.put("SELL_SNS", seller.getSELL_SNS()); // 소셜 아이디
		
		sellerDAO.insertSeller(map);
	}
	
	@Override
	public List<Map<String, Object>> sellerFindId(Map<String, Object> map) throws Exception {
		return sellerDAO.selectSellerFindId(map);
	}
	
	public List<Map<String, Object>> sellerFindIdPhone(Map<String, Object> map) throws Exception {
		return sellerDAO.selectSellerIdPhone(map);
	}
	
	@Override
	public List<Map<String, Object>> sellerFindPw(Map<String, Object> map) throws Exception {
		return sellerDAO.selectSellerPw(map);
	}
	
}
