package coffeeDao.common.review;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import coffeeDao.model.ProductBean;
import coffeeDao.model.ReviewBean;

@Controller
public class ReviewController {
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	//리뷰 작성
	@RequestMapping("/reviewWrite.da")
	public String insertReview(RedirectAttributes rttr, ProductBean product, ReviewBean review, BindingResult result, Model model) throws Exception {		
		
		System.out.println("아이템 아이디: " + review.getRE_ITEM());
		product.setITEM_ID(review.getRE_ITEM());
		
		reviewService.insertReview(review);
		System.out.println("insert review");
		//review의 RE_ITEM을 ITEM_ID에 담아서 redirect위치로 값을 전달
		rttr.addAttribute("ITEM_ID", review.getRE_ITEM());
		
		
		
		return "redirect:/productDetail.da";
	}
	
	@RequestMapping(value = "/deleteReview.da", method = {RequestMethod.GET})
	public String deleteReview(@RequestParam(value = "RE_IDX", required = false) int RE_IDX, @RequestParam(value = "ITEM_ID", required = false) int ITEM_ID, Model model, RedirectAttributes rttr, HttpSession session) throws Exception {		
		
		System.out.println("ITEM_ID: " + ITEM_ID);
		System.out.println("삭제할 RE_IDX: " + RE_IDX);
		
		rttr.addAttribute("ITEM_ID", ITEM_ID);
		session.setAttribute("ITEM_ID", ITEM_ID);
		
		
		reviewService.deleteReview(RE_IDX);
		
		return "redirect:/productDetail.da";
	}

}
