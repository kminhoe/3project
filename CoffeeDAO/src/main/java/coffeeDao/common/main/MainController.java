package coffeeDao.common.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import coffeeDao.common.seller.SellerService;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@Resource(name = "sellerService")
	private SellerService sellerService;
	
	// 메인
	@RequestMapping(value = "/home.da")
	public String main(Model model) throws Exception {
		
		List<Map<String, Object>> bestProductList = new ArrayList<Map<String, Object>>(); // 베스트 상품 리스트 객체
		List<Map<String, Object>> bestSellerList = new ArrayList<Map<String, Object>>(); // 베스트 업체 리스트 객체
		List<Map<String,Object>> sellerList = new ArrayList<Map<String,Object>>();
		

		bestProductList = mainService.bestItemList(); // 베스트 상품 리스트 불러오기
		bestSellerList = mainService.bestSellerList(); // 베스트 업체 리스트 불러오기
		sellerList = sellerService.sellerList(1, 3);
		
		
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("bestItemList", bestProductList);
		model.addAttribute("bestSellerList", bestSellerList);

		return "/index";
	}
}
