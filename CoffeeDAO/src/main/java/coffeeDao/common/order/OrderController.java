package coffeeDao.common.order;

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
import coffeeDao.model.OrderBean;

@Controller
public class OrderController {

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "mypageService")
	private MypageService mypageService;
	
	@Resource(name = "orderService")
	private OrderService orderService;
	
	

	//바로주문 시 이동경로
		@RequestMapping(value = "/putOrder.da")
		public ModelAndView putOrder(HttpSession session, CartBean cart, RedirectAttributes rttr, 
				HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("/order/pOrderForm");
			
		
			List<HashMap<String, Object>> list = new ArrayList<>();
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			HashMap<String, Object> id = new HashMap<String, Object>();

			id.put("MEM_ID", session.getAttribute("MEM_ID"));
			Map<String, Object> member = mypageService.detailMember(id);
			map.put("ORDER_MEM", member.get("MEM_NAME"));
			map.put("ORDER_ADDR1", member.get("MEM_ADDR1"));
			map.put("ORDER_ADDR2", member.get("MEM_ADDR2"));
			map.put("ORDER_ZP", member.get("MEM_ZP"));
			map.put("ORDER_PHONE", member.get("MEM_PHONE"));
		
	        
			map.put("ORDER_ITEM", cart.getCART_NAME());
			map.put("ORDER_NO", cart.getCART_ID());
			map.put("ORDER_PRICE", cart.getCART_PRICE());
			
			
			System.out.println("ORDER_IMAGE : " + cart.getITEM_IMAGE());
			
			map.put("ORDER_COUNT", cart.getCART_COUNT());
			map.put("ORDER_GRIND", cart.getCART_GRIND());
			map.put("ORDER_CART", 0);
			
			HashMap<String, Object> item = new HashMap<String, Object>();
			
			int num = cart.getCART_ID();
	        item = (HashMap<String, Object>) orderService.selectItem(num);
			
			if(cart.getCART_PRICE() == 1) { //가격
				map.put("PRICE", item.get("ITEM_200"));
			} else {
				map.put("PRICE", item.get("ITEM_500"));
			}
			
			map.put("ORDER_SELLER", item.get("SELL_ID"));
			map.put("ORDER_IMAGE", item.get("ITEM_IMAGE"));
			
			list.add(map);
			
			mv.addObject("list", list);
			

			
			return mv;
		}
	
	
	// 주문폼
	@RequestMapping(value = "/pOrderForm.da")
	@ResponseBody
	public ModelAndView pOrderForm(HttpSession session, @RequestParam(value = "chk[]") List<String> chArr,
			@RequestParam(value = "no_chk[]") List<String> no_chk, @ModelAttribute CartBean cartBeanList)
			throws Exception {

		// map ->list 로 변환
		List<HashMap<String, Object>> list = new ArrayList<>();
//		List<Map<String, Object>> item = new ArrayList<>();

		ModelAndView mv = new ModelAndView("/order/pOrderForm");

		// member 정보 꺼내기
		HashMap<String, Object> id = new HashMap<String, Object>();

		id.put("MEM_ID", session.getAttribute("MEM_ID"));
		Map<String, Object> member = mypageService.detailMember(id);

		int cartNum = 0;
		for (String i : chArr) {
			cartNum = Integer.parseInt(i);

			// map에 member 정보 담기
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("ORDER_MEM", member.get("MEM_NAME"));
			map.put("ORDER_ADDR1", member.get("MEM_ADDR1"));
			map.put("ORDER_ADDR2", member.get("MEM_ADDR2"));
			map.put("ORDER_ZP", member.get("MEM_ZP"));
			map.put("ORDER_PHONE", member.get("MEM_PHONE"));

			System.out.println("이름 : " + member.get("MEM_NAME"));
			System.out.println("이메일 : " + member.get("MEM_EMAIL"));

			// 선택된 인덱스 값
			System.out.println("cart -> CHK orderList : " + cartNum);

			cartService.selectNum(cartBeanList.getCartBeanList().get(cartNum).getCART_IDX());

			map.put("ORDER_CART", cartBeanList.getCartBeanList().get(cartNum).getCART_IDX());
			map.put("ORDER_COUNT", cartBeanList.getCartBeanList().get(cartNum).getCART_COUNT());
			map.put("ORDER_PRICE", cartBeanList.getCartBeanList().get(cartNum).getCART_PRICE());
			map.put("ORDER_GRIND", cartBeanList.getCartBeanList().get(cartNum).getCART_GRIND());
			map.put("ORDER_ITEM", cartBeanList.getCartBeanList().get(cartNum).getCART_NAME()); // 상품 이름
			map.put("ORDER_NO", cartBeanList.getCartBeanList().get(cartNum).getCART_ID()); //상품 코드
			map.put("ORDER_SELLER", cartBeanList.getCartBeanList().get(cartNum).getITEM_SELLER()); //상품 seller
			
			map.put("ORDER_IMAGE", cartBeanList.getCartBeanList().get(cartNum).getITEM_IMAGE());

			System.out.println("count 값 : " + cartBeanList.getCartBeanList().get(cartNum).getCART_COUNT());
			System.out.println("id 값 : " + cartBeanList.getCartBeanList().get(cartNum).getCART_ID());

			// 용량에 따른 가격 변동
			int price = cartBeanList.getCartBeanList().get(cartNum).getCART_PRICE();

			if (price == 1) {
				map.put("PRICE", cartBeanList.getCartBeanList().get(cartNum).getITEM_200());
			} else if (price == 2) {
				map.put("PRICE", cartBeanList.getCartBeanList().get(cartNum).getITEM_500());
			}

			list.add(map);

		}

		mv.addObject("list", list);

		// 선택되지 않은 체크박스는 N으로 설정
		int NotNum = 0;
		for (String j : no_chk) {

			NotNum = Integer.parseInt(j);

			// IDX 값
			System.out.println("cart -> CHK orderList : " + no_chk);
			cartService.selectNot(NotNum);

		}

		return mv;

	}

	@RequestMapping(value = "/pOrder.da")
	public String pOrder(@ModelAttribute OrderBean orderBeanList, RedirectAttributes rttr, HttpSession session) 
			throws Exception {
		
		//랜덤번호
		Random random = new Random();	//랜덤 함수 선언
		int createNum = 0;  			//1자리 난수
		String ranNum = ""; 			//1자리 난수 형변환 변수
        int letter    = 10;			    //난수 자릿수:10
		String resultNum = "";  		//결과 난수
		
		for (int i=0; i<letter; i++) { 
            		
			createNum = random.nextInt(9);		//0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
			resultNum += ranNum;			//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열 -> 주문번호
		}


		// order 등록 서비스 실행
		//ModelAndView mv = new ModelAndView("redirect:/pOrderResult.da");
		
		List<HashMap<String, Object>> list = new ArrayList<>();
		
		for(int i=0;i<orderBeanList.getSIZE();i++) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("ORDER_CART", (Integer)orderBeanList.getOrderBeanList().get(i).getORDER_CART());
			
			
			 //String mem = orderBeanList.getORDER_MEM(); 
			 
			 //String[] ORDER_MEM = mem.split(","); 
			 
			 map.put("ORDER_MEM", session.getAttribute("MEM_ID"));
			 map.put("ORDER_ID", resultNum); 
			 
			
			map.put("ORDER_NAME", orderBeanList.getORDER_NAME());
			map.put("ORDER_NO", orderBeanList.getOrderBeanList().get(i).getORDER_NO());
			map.put("ORDER_ITEM", orderBeanList.getOrderBeanList().get(i).getORDER_ITEM());
			map.put("ORDER_COUNT", orderBeanList.getOrderBeanList().get(i).getORDER_COUNT());
			map.put("ORDER_PRICE", orderBeanList.getOrderBeanList().get(i).getORDER_PRICE());
			map.put("ORDER_TOT", orderBeanList.getOrderBeanList().get(i).getORDER_TOT());
			map.put("ORDER_ADDR1", orderBeanList.getORDER_ADDR1());
			map.put("ORDER_ADDR2", orderBeanList.getORDER_ADDR2());
			map.put("ORDER_ZP", orderBeanList.getORDER_ZP());
			map.put("ORDER_PHONE", orderBeanList.getORDER_PHONE());
			map.put("ORDER_HOLDER", orderBeanList.getORDER_HOLDER());
			
			map.put("ORDER_IMAGE", orderBeanList.getOrderBeanList().get(i).getORDER_IMAGE());
			//map.put("ORDER_BILL", orderBeanList.getOrderBeanList().get(i).getORDER_BILL());
			map.put("ORDER_STATE", "주문완료");
			map.put("ORDER_SELLER", orderBeanList.getOrderBeanList().get(i).getORDER_SELLER());
			//map.put("ORDER_MEMO", orderBeanList.getOrderBeanList().get(i).getORDER_MEMO());
			map.put("ORDER_GRIND", orderBeanList.getOrderBeanList().get(i).getORDER_GRIND());
			
			map.put("PRICE", orderBeanList.getOrderBeanList().get(i).getPRICE());
			
			if(orderBeanList.getORDER_BILL() == null) {
				map.put("ORDER_BILL", "NO");
			} else {
				map.put("ORDER_BILL", orderBeanList.getORDER_BILL());
			}
			
			if(orderBeanList.getORDER_MEMO() == "배송 입력사항(선택)") {
				map.put("ORDER_MEMO", "-");
			} else {
				map.put("ORDER_MEMO", orderBeanList.getORDER_MEMO());
			}


			orderService.insertOrder(map);
			
			
			list.add(map);
			
			HashMap<String, Object> delete = new HashMap<String, Object>();
			delete.put("CART_IDX", orderBeanList.getOrderBeanList().get(i).getORDER_CART());
			
			orderService.deleteList(delete);
			
			System.out.println("이미지 출력 : " + orderBeanList.getOrderBeanList().get(i).getORDER_IMAGE());
			
			
		} //주문
		
		rttr.addFlashAttribute("list", list); //데이터 전달
		rttr.addFlashAttribute("ORDER_ID", resultNum); //주문번호
		
		//결제
		int total = 0;
		for(int i=0;i<orderBeanList.getSIZE();i++) {
			
			total += orderBeanList.getOrderBeanList().get(i).getORDER_TOT();
			
		}
		
		total = total+2500; //배송비
		
		System.out.println("total : " + total);
		
		HashMap<String, Object> payment = new HashMap<String, Object>();
		payment.put("PAY_ID", resultNum);
		payment.put("PAY_TOT", total);
		
		orderService.insertPayment(payment);
		
		

		return "redirect:/pOrderResult.da";
	}

	@RequestMapping(value = "/pOrderResult.da")
	public ModelAndView pOrderResult(OrderBean order) throws Exception {
	
		ModelAndView mv = new ModelAndView("/order/pOrderResult");
		
		return mv;

	}
}
