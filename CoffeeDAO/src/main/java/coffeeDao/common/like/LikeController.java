package coffeeDao.common.like;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import coffeeDao.common.cart.CartService;
import coffeeDao.common.member.MypageService;
import coffeeDao.model.CartBean;
import coffeeDao.model.LikeBean;
import coffeeDao.model.OrderBean;
import coffeeDao.model.ProductBean;

@Controller
public class LikeController {

	@Resource(name = "likeService")
	private LikeService likeService;

	// 찜하기 상품 상세보기
	@RequestMapping(value = "/putLike.da")
	public String putLike(LikeBean likeBean, HttpSession session, ProductBean product, RedirectAttributes rttr)
			throws Exception {

		//System.out.println("찜 확인");

		likeService.putLike(likeBean, session);

		//product.setITEM_ID(likeBean.getUP_ID());
	
		session.setAttribute("ITEM_ID", likeBean.getUP_ID());

		return "redirect:/productDetail.da";

	}
	
	//찜하기 리스트
	@RequestMapping(value = "/putLikeL.da")
	public String putLikeL(LikeBean likeBean, HttpSession session, ProductBean product, RedirectAttributes rttr)
			throws Exception {

		System.out.println("현재 진행상황");

		likeService.putLike(likeBean, session);
	
		session.setAttribute("ITEM_ID", likeBean.getUP_ID());

		return "redirect:/productList.da";

	}
	
    
	//삭제
	@RequestMapping(value = "/deleteLike.da") 
	  public String deleteLike(LikeBean likeBean, HttpSession session, ProductBean product, RedirectAttributes rttr) 
			  throws Exception {

	   // product.setITEM_ID(likeBean.getUP_ID());
	    
	    session.setAttribute("ITEM_ID", likeBean.getUP_ID());
	 
		
		likeService.deleteLike(likeBean, session);
	    
		return "redirect:/productDetail.da";
	    
	    
	}
	
	//삭제 L
		@RequestMapping(value = "/deleteLikeL.da") 
		  public String deleteLikeL(LikeBean likeBean, HttpSession session, ProductBean product, RedirectAttributes rttr) 
				  throws Exception {

		   // product.setITEM_ID(likeBean.getUP_ID());
		    
		    session.setAttribute("ITEM_ID", likeBean.getUP_ID());
		 
			
			likeService.deleteLike(likeBean, session);
		    
			return "redirect:/productList.da";
		    
		    
		}

	//카운트
}
