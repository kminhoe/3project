package coffeeDao.common.cart;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.model.CartBean;

@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService cartService;
	
	//장바구니에 담기
		@RequestMapping(value = "/putCart.da")
		public String putCart(CartBean cart, BindingResult result, Model model) throws Exception {		

			System.out.println("insert cart");
			System.out.println(cart.getCART_NAME());
			
			// MEM_ID를 CART_MEM으로 받아옴.
			// ITEM_ID를 CART_ID로 받아옴.
			// CART_COUNT,ITEM_GRIND 값을 넘겨받음.
			cartService.insertCart(cart);
			return "redirect:/cartList.da";
		}

	// 장바구니 리스트
	@RequestMapping(value = "/cartList.da", method = { RequestMethod.GET })
	public ModelAndView cartList(HttpSession session,
			HttpServletResponse response) throws Exception {

		ModelAndView mv = new ModelAndView("/cart/cartList");

		String cart_mem = (String) session.getAttribute("MEM_ID");

		System.out.println(cart_mem);

		List<Map<String, Object>> list = cartService.cartList(cart_mem);

		mv.addObject("cartList", list);
		
		return mv;

	}
	
	//장바구니 삭제
	@RequestMapping(value = "/cartDelete.da")
	public ModelAndView cartDelete (CartBean cartBean, HttpServletRequest request) throws Exception {
		
		System.out.println("삭제 확인");
		System.out.println("삭제 확인 : " + request.getParameter("CART_IDX"));
		
		ModelAndView mv = new ModelAndView("redirect:/cartList.da");
		
		cartService.cartDelete(cartBean);
		
		return mv;
		
	}
	
	 
	
	
	 

}
