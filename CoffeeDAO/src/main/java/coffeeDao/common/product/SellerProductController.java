package coffeeDao.common.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.common.CommandMap;
import coffeeDao.common.util.Pagination;
import coffeeDao.model.ProductBean;

@Controller
public class SellerProductController {
	@Autowired
	ProductService productService;

	// 상품 등록 폼 화면
		@RequestMapping(value = "/productWriteForm.da")
		public ModelAndView productWriteForm(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("item/productWriteForm");
			return mv;
		}

		// 상품 등록 작업
		@RequestMapping(value = "/productWritePro.da")
		public ModelAndView productWriteFormPro(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:sellerProductList.da");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("SELL_ID");
			commandMap.put("SELL_ID", id);
			productService.enrollItem(commandMap.getMap(), request);
			return mv;
		}
		

		// 상품 수정 폼 화면
		@RequestMapping(value = "/productUpdateForm.da")
		public ModelAndView productUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/productUpdateForm");
			List<Map<String, Object>> list = productService.myProductDetail(commandMap.getMap());
			mv.addObject("list", list);
			return mv;
		}

		// 상품&상품 이미지 수정 작업
		@RequestMapping(value = "/productUpdatePro.da")
		public ModelAndView productUpdatePro(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:sellerProductList.da");
			productService.modifyItem(commandMap.getMap(), request);
			productService.modifyItemImg(commandMap.getMap(), request);
			return mv;
		}

		// 상품&상품 이미지 삭제
		@RequestMapping(value = "/productDeletePro.da")
		public ModelAndView productDelete(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:sellerProductList.da");
			productService.removeItem(commandMap.getMap());
			productService.removeItemImg(commandMap.getMap());
			return mv;
		}

		// 판매자 페이지 - 상품관리 - 상품 리스트 - 페이징
		@RequestMapping(value = "/sellerProductList.da", method = RequestMethod.GET)
		public ModelAndView sellerProductList(@RequestParam(defaultValue = "1") int nowPage, CommandMap commandMap,
				HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/sellerProductList");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("SELL_ID");
			commandMap.put("SELL_ID", id);
			int totalItem = productService.myProductCount(commandMap.getMap());
			Pagination pagination = new Pagination();
			pagination.setNowPage(nowPage);
			pagination.setTotalItem(totalItem);
			pagination.setStartPagePerLine(nowPage);
			pagination.setPrevPage(nowPage);
			pagination.setNextPage(nowPage);
			pagination.setTotalPage(totalItem);
			int startPagePerLine = pagination.getStartPagePerLine();
			pagination.setEndPagePerLine(startPagePerLine);
			commandMap.put("nowPage", nowPage);
			List<Map<String, Object>> list = productService.myProductList(commandMap.getMap());
			mv.addObject("list", list);
			mv.addObject("pagination", pagination);
			return mv;
		} 

		// 판매자 페이지 - 상품관리 - 상품 리스트 - 상품 디테일
		@RequestMapping(value = "/sellerProductDetail.da", method = RequestMethod.GET)
		public ModelAndView sellerProductDetail(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("item/sellerProductDetail");
			List<Map<String, Object>> list = productService.myProductDetail(commandMap.getMap());
			mv.addObject("list", list);
			return mv;
		}
		
		// 판매자 페이지 - 상품관리 - 상품 리스트 - 상품 리뷰 리스트 - 페이징
		@RequestMapping(value = "/sellerProductReview.da", method = RequestMethod.GET)
		public ModelAndView sellerProductReview(@RequestParam(defaultValue = "1") int nowPage, CommandMap commandMap,
				HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/sellerProductReview");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("SELL_ID");
			commandMap.put("SELL_ID", id);
			int itemid = Integer.parseInt(request.getParameter("ITEM_ID"));
			commandMap.put("RE_ITEM", itemid);
			int totalReview = productService.myProductReviewCount(commandMap.getMap());
			Pagination pagination = new Pagination();
			pagination.setNowPage(nowPage);
			pagination.setTotalReview(totalReview);
			pagination.setStartPagePerLine(nowPage);
			pagination.setPrevPage(nowPage);
			pagination.setNextPage(nowPage);
			pagination.setTotalReviewPage(totalReview);
			int startPagePerLine = pagination.getStartPagePerLine();
			pagination.setEndReviewPagePerLine(startPagePerLine);
			commandMap.put("nowPage", nowPage);
			List<Map<String, Object>> list = productService.myProductReviewList(commandMap.getMap());
			mv.addObject("list", list);
			mv.addObject("pagination", pagination);
			return mv;
		}

		// 판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기
		@RequestMapping(value = "/productReviewDetail.da")
		public ModelAndView productReviewDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/productReviewDetail");
			int itemidx = Integer.parseInt(request.getParameter("RE_IDX"));
			int itemid = Integer.parseInt(request.getParameter("RE_ITEM"));
			Map<String, Object> map = productService.myProductReviewDetail(commandMap.getMap());
			Map<String, Object> maps = productService.myProductReviewAnswerDetail(commandMap.getMap());
			mv.addObject("RE_IDX", itemidx);
			mv.addObject("RE_ITEM", itemid);
			mv.addObject("map", map);
			mv.addObject("maps", maps);
			return mv;
		}

		// 판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 등록 폼
		@RequestMapping(value = "/productAnswerWriteForm.da")
		public ModelAndView productReviewWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/productAnswerWriteForm");
			Map<String, Object> map = productService.myProductReviewDetail(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		}

		// 판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 등록 작업
		@RequestMapping(value = "/productAnswerWritePro.da")
		public ModelAndView productReviewWritePro(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:sellerProductReview.da");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("SELL_ID");
			commandMap.put("RE_SELLER", id);
			int itemid = Integer.parseInt(String.valueOf(commandMap.get("ITEM_ID")));
			productService.enrollAnswer(commandMap.getMap());
			mv.addObject("ITEM_ID", itemid);
			return mv;
		}
		
		// 판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 수정 폼 화면
		@RequestMapping(value = "/productAnswerUpdateForm.da")
		public ModelAndView productAnswerUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("item/productAnswerUpdateForm");
			Map<String, Object> map = productService.myProductReviewDetail(commandMap.getMap());
			Map<String, Object> maps = productService.myProductReviewAnswerDetail(commandMap.getMap());
			mv.addObject("map", map);
			mv.addObject("maps", maps);
			return mv;
		}
		
		// 판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 수정 작업
		@RequestMapping(value = "/productAnswerUpdatePro.da")
		public ModelAndView productAnswerUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:sellerProductReview.da");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("SELL_ID");
			commandMap.put("RE_SELLER", id);
			int itemid = Integer.parseInt(String.valueOf(commandMap.get("ITEM_ID")));
			productService.modifyAnswer(commandMap.getMap());
			mv.addObject("ITEM_ID", itemid);
			return mv;
		}	
}