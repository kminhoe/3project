package coffeeDao.common.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.community.PagingVO;

@Controller
public class SellerOrderController {
	
	@Resource(name = "sellerService")
	private SellerService sellerService;
	
//	@RequestMapping(value= "/sellerOrderList.da")
//	public String sellerOrderList(PagingVO pagingVO, Model model,
//			@RequestParam(value="type", required=false) String type,
//			@RequestParam(value="keyword", required=false) String keyword,
//			@RequestParam(value="nowPage", required=false) String nowPage,
//			@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception{
//		List<Map<String, Object>> sellerOrderListView = new ArrayList<Map<String, Object>>();
//
//		// 페이지 값이 null 기본 값으로 변경
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "10";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "10";
//		}
//
//		
//		
//		if (keyword == null) { keyword = ""; }
//		
//		int total = sellerService.countSellerOrder("1", keyword); // 전체 게시글 수 불러오기
//		
//		// 페이징 VO 객체 생성
//		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), seller, keyword);
//		
//		sellerOrderListView = sellerService.sellerOrderList(pagingVO); // 게시판 리스트 불러오기
//
//		model.addAttribute("paging", pagingVO); // 페이징 VO 객체
//		model.addAttribute("freeTalkList", sellerOrderListView); // 게시판 리스트 뷰
//		model.addAttribute("seller", seller);
//		
//		return "/seller/sellerOrderList";
//		
//	}
	
	@RequestMapping(value="/sellerOrderList.da")
	@ResponseBody
	public ModelAndView sellerOrderList (Map<String, Object> map, HttpServletRequest req, PagingVO pagingVO,
			@RequestParam(value="SELL_ID", required=false) String seller,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage,
			@RequestParam(value="startDate", required=false) String startDate,
			@RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="state", required=false) String state) throws Exception{
		
		ModelAndView mv = new ModelAndView("/seller/sellerOrderList");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("SELL_ID");
		
		String SELL_ID = id;
		
		// 페이지 값이 null 기본 값으로 변경
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "10";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "10";
				}
				
				if (seller == null) { seller = SELL_ID;}
				if (keyword == null) { keyword = ""; }
				if (startDate == null) {startDate = "19780101";}
				if (endDate == null) {endDate = "30001231";}
		
		
		
		map.put("SELL_ID", id);
		
		int total = sellerService.countSellerOrder(id, keyword); // 전체 게시글 수 불러오기
		
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), seller, keyword);
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<Map<String, Object>> orderList = sellerService.sellerOrderList(map);
		
		
		mv.addObject("orderList", orderList);
		mv.addObject("paging", pagingVO);
		
		
		return mv;
	}
	
	@RequestMapping(value = "stateUpdate.da", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> orderStateUpdate (@RequestBody Map<String, Object> map) throws Exception{
		Map<String, Object> result = new HashMap<>();
		
		try {
			sellerService.orderStateUpdate(map);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		return result;
	}
	

}
