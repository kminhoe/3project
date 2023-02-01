package coffeeDao.common.seller;

import java.util.List;
import java.util.Map;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.SellerBean;

public interface SellerService {

	public Map<String, Object> detailSeller(SellerBean seller) throws Exception; // 회원수정 - 선택

	public void modifySeller(SellerBean seller, MultipartHttpServletRequest image) throws Exception; // 회원수정 - 수정
	
	public void deleteSeller(SellerBean seller) throws Exception; // 업체 탈퇴
	
	public List<Map<String,Object>> sellerList(int START, int END) throws Exception;
	
	public int sellerListCount()throws Exception;
	
	public List<Map<String,Object>> adminSellerList(PagingVO pagingVO) throws Exception;
	
	public int countSeller(String keyword) throws Exception;
	
	public void adminSellerValidate(SellerBean seller) throws Exception;
	
	public List<Map<String,Object>> adminNonValidatedSeller(PagingVO pagingVO) throws Exception;
	
	//판매자 주문내역
		public List<Map<String, Object>> sellerOrderList(Map<String, Object> map) throws Exception;
		
		public int countSellerOrder(String seller, String keyword) throws Exception;
		
		public void orderStateUpdate(Map<String, Object> map) throws Exception;

}
