package coffeeDao.common.seller;

import java.util.List;
import java.util.Map;

import coffeeDao.model.SellerBean;

public interface SellerJoinService {
	public Map<String, Object> selectSellerId(SellerBean seller) throws Exception; // 아이디 확인
	
	public void insertSeller(SellerBean seller) throws Exception; // 회원가입
	
	public List<Map<String, Object>> sellerFindId(Map<String, Object> map) throws Exception; //아이디 찾기 
	
	public List<Map<String, Object>> sellerFindIdPhone(Map<String, Object> map) throws Exception; // 번호로 찾기
	
	public List<Map<String, Object>> sellerFindPw(Map<String, Object> map) throws Exception; // 비밀번호 찾기
}
