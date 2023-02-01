package coffeeDao.common.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import coffeeDao.common.community.PagingVO;
import coffeeDao.model.SellerBean;

@Service("sellerService")
public class SellerServiceImpl implements SellerService {

	@Resource(name = "sellerDAO")
	private SellerDAO sellerDAO;

	@Override
	public Map<String, Object> detailSeller(SellerBean seller) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SELL_ID", seller.getSELL_ID());
		map.put("SELL_IMAGE", seller.getSELL_IMAGE());

		return sellerDAO.detailSeller(map);

	}

	@Override
	public void modifySeller(SellerBean seller, MultipartHttpServletRequest image) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SELL_PWD", seller.getSELL_PWD()); // 패스워드
		map.put("SELL_NAME", seller.getSELL_NAME()); // 상호명
		map.put("SELL_PHONE", seller.getSELL_PHONE()); // 전화번호
		map.put("SELL_ADDR1", seller.getSELL_ADDR1()); // 주소
		map.put("SELL_ADDR2", seller.getSELL_ADDR2()); // 상세주소
		map.put("SELL_ZP", seller.getSELL_ZP()); // 우편번호
		map.put("SELL_EMAIL", seller.getSELL_EMAIL()); // 이메일
		map.put("SELL_CONT", seller.getSELL_CONT()); // 기업 소개
		map.put("SELL_SNS", seller.getSELL_SNS()); // 소셜 아이디
		map.put("SELL_BANK", seller.getSELL_BANK()); // 은행
		map.put("SELL_BNUM", seller.getSELL_BNUM()); // 계좌번호
		map.put("SELL_ID", seller.getSELL_ID()); // 아이디

		// 이미지 받기
		MultipartFile sell_prof = image.getFile("SELL_PROF_UPLOADFILE");
		System.out.println("이미지 이름 : " + sell_prof.getOriginalFilename());
		String SELL_PROF = seller.getSELL_NAME() + "_logo_" + sell_prof.getOriginalFilename();
		map.put("SELL_PROF", SELL_PROF);

		// 멀티 이미지 받기
		List<MultipartFile> sell_image = image.getFiles("SELL_IMAGE_UPLOADFILE");

		String SELL_IMAGE = "";

		System.out.println("파일 개수 : " + sell_image.size());

		for (int i = 0; i < sell_image.size(); i++) {

			SELL_IMAGE += seller.getSELL_NAME() + "_image_" + sell_image.get(i).getOriginalFilename() + ",";

		}

		// 마지막 , 삭제
		SELL_IMAGE = SELL_IMAGE.substring(0, SELL_IMAGE.length() - 1);

		System.out.println("이미지 이름 : " + SELL_IMAGE);
		map.put("SELL_IMAGE", SELL_IMAGE);

		sellerDAO.modifySeller(map);

	}

	@Override
	public void deleteSeller(SellerBean seller) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		int state = 2;
		
		map.put("SELL_ID", seller.getSELL_ID());
		System.out.println("넘어오는 값 확인 : " + seller.getSELL_ID());
		map.put("SELL_STATE", state);
		
		sellerDAO.deleteSeller(map);
	}

	@Override
	public List<Map<String, Object>> sellerList(int START, int END) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("START", START);
		map.put("END", END);
		return sellerDAO.sellerList(map);
	}

	@Override
	public int sellerListCount() throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> resultMap = sellerDAO.sellerListCount();
		return Integer.parseInt(String.valueOf(resultMap.get("COUNT")));
	}

	@Override
	public List<Map<String, Object>> adminSellerList(PagingVO pagingVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return sellerDAO.adminSellerList(map);
	}

	@Override
	public int countSeller(String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("KEYWORD", "%" + keyword + "%");
		
		return sellerDAO.countSeller(map);
	}

	@Override
	public void adminSellerValidate(SellerBean seller) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("SELL_ID", seller.getSELL_ID());
		map.put("SELL_STATE", seller.getSELL_STATE());
		sellerDAO.adminSellerValidate(map);
	}

	@Override
	public List<Map<String, Object>> adminNonValidatedSeller(PagingVO pagingVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("KEYWORD", "%" + pagingVO.getKeyword() + "%");
		
		return sellerDAO.adminNonValidatedSeller(map);
	}
	
	
	@Override
	public List<Map<String, Object>> sellerOrderList(Map<String, Object> map) throws Exception {
				
		return sellerDAO.sellerOrderList(map);
	}

	@Override
	public int countSellerOrder(String seller, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ORDER_SELLER", seller);
		map.put("KEYWORD", "%" + keyword + "%");
		
		return sellerDAO.countSellerOrder(map);
	}

	@Override
	public void orderStateUpdate(Map<String, Object> map) throws Exception {
		sellerDAO.stateUpdate(map);
		
	}

}
