package coffeeDao.common.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.common.CommandMap;
import coffeeDao.common.like.LikeService;
import coffeeDao.common.order.OrderService;
import coffeeDao.common.seller.SellerService;
import coffeeDao.model.CartBean;
import coffeeDao.model.LikeBean;
//import coffeeDao.model.CartBean;
import coffeeDao.model.MapToBean;
import coffeeDao.model.OrderBean;
import coffeeDao.model.ProductBean;
import coffeeDao.model.SellerBean;

@Controller
public class ProductController {
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "sellerService")
	private SellerService sellerService;
	
	@Resource(name = "likeService")
	private LikeService likeService;
	
	@Resource(name = "orderService")
	private OrderService orderService;

	//상품 리스트
			@SuppressWarnings({ "null", "unchecked" })
			@RequestMapping(value = "/productList.da")
			public String productList(ProductBean product, Model model, LikeBean like, HttpSession session) throws Exception {
				
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
				list = productService.selectProductList(product);
				
				List<ProductBean> productBeanList = new ArrayList<ProductBean>();
				for (Map<String, Object> mapObject : list) {
					productBeanList.add(MapToBean.mapToProduct(mapObject));
					
					
				}
				
				//찜하기
				List<Integer> item = new ArrayList<Integer>();
				
				session.removeAttribute("ITEM_ID");
				System.out.println(session.getAttribute("MEM_ID"));
				
				if(session.getAttribute("MEM_ID") != null) {
					
					for(int k = 0;k<productBeanList.size();k++) {
						
						//Number id = productBeanList.get(k).getITEM_ID();

						item.add(Integer.parseInt(String.valueOf(productBeanList.get(k).getITEM_ID())));
						
					}
					System.out.println("아이템 : " + item);

				for(int i = 0;i<productBeanList.size();i++) {
					
					Map<String, Object> Like = new HashMap<String, Object>();
					Like.put("UP_ID", productBeanList.get(i).getITEM_ID());
					Like.put("UP_MEM", session.getAttribute("MEM_ID"));
					
					Map<String, Object> LIKE = likeService.selectLike(Like);


				    // || LIKE.get("UP_ID") == Like.get("UP_ID")
					if(LIKE != null) {
						//productBeanList.get(i).setLike(1); //로그인하고 찜 눌렀을 때
						//LIKE.put("ITEM_ID", LIKE.get("UP_ID"));
						int index = Integer.parseInt(String.valueOf(LIKE.get("UP_ID")));

						int num = item.indexOf(index);
						
						
						System.out.println(num);
						productBeanList.get(num).setLike(1);
						
					} else { 
						productBeanList.get(i).setLike(2); //로그인하고 찜 안눌렀을 때
					}
					
				   }
				}  else {
				for(int j = 0;j<productBeanList.size();j++) {
					productBeanList.get(j).setLike(0);} //로그인 안했을때
				}
				model.addAttribute("productBeanList", productBeanList);
				model.addAttribute("type", product.getITEM_TYPE());
				model.addAttribute("caf", product.getITEM_CAF());
				model.addAttribute("grind", product.getITEM_GRIND());
				model.addAttribute("ITEM_LOC", product.getITEM_LOC());
				model.addAttribute("taste", product.getITEM_TASTE());
				
				//menu 중복 제거 start.
				HashSet<String> hsCaf = new HashSet<String>();
				HashSet<String> hsType = new HashSet<String>();
				HashSet<String> hsTaste = new HashSet<String>();
				HashSet<String> hsLoc = new HashSet<String>();
				for(int i=0; i < productBeanList.size(); i++) {
					hsCaf.add(productBeanList.get(i).getITEM_CAF());
					hsType.add(productBeanList.get(i).getITEM_TYPE());
					hsTaste.add(productBeanList.get(i).getITEM_TASTE());
					hsLoc.add(productBeanList.get(i).getITEM_LOC());
				}
				model.addAttribute("hsCaf", hsCaf);
				model.addAttribute("hsType", hsType);
				model.addAttribute("hsTaste", hsTaste);
				model.addAttribute("hsLoc", hsLoc);
				//menu 중복 제거 end.
				
				return "product/productListForm";
				
			}
			
			@RequestMapping(value="/productListPro.da")
			public String productListPro(ProductBean product, Model model) throws Exception{
				String type;
				String caf;
				String loc;
				String taste;
				
				List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
				
				list = productService.selectProductList(product);
				
				return "redirect:/productList.da";
			}
		
		//상품 디테일
		@RequestMapping("/productDetail.da") 
		public String productDetail(ProductBean product, Model model, LikeBean like, 
				HttpSession session, HttpServletRequest request, CartBean cart, OrderBean order) throws Exception {
			
//			//redirect로 받아온 값이 있다면.
//			if((Integer)ITEM_ID !=  null) {
//			//redirect로 받은 ITEM_ID를 product에 주입.
//			product.setITEM_ID(ITEM_ID);
//			}

			System.out.println("여기까진 됨1");
			System.out.println(product.getITEM_ID());
			System.out.println(like.getUP_ID());
			
			List<Map<String, Object>> reviewList = new ArrayList<Map<String, Object>>();
			
			if(like.getUP_ID() != 0) {
			product.setITEM_ID(like.getUP_ID()); }
			
			if(session.getAttribute("ITEM_ID") != null) {
				product.setITEM_ID((Number)session.getAttribute("ITEM_ID"));
				reviewList = productService.reviewList((int)session.getAttribute("ITEM_ID"));
			} 
			
			List<Map<String,Object>> map = productService.selectProductId(product);
			System.out.println(map);
            
			//사진 이미지
			Map<String,Object> image = new HashMap<String,Object>();
			
			image.put("ITEM_IMAGE", map.get(0).get("FILE_STD"));
			image.put("ITEM_ID", product.getITEM_ID());
			productService.updateImage(image);
			
			cart.setITEM_IMAGE((String)map.get(0).get("FILE_STD"));
			
			//찜하기
			if(session.getAttribute("MEM_ID") != null ) {
			  Map<String, Object> Like = new HashMap<String, Object>(); 
			  Like.put("UP_ID", product.getITEM_ID()); 
			  Like.put("UP_MEM", session.getAttribute("MEM_ID"));
			  
			  Map<String, Object> yes = new HashMap<String, Object>();
			 
			
			  if(likeService.selectLike(Like) != null) { 
				  product.setLike(1); } 
			  else { product.setLike(2); }
			  
			} 
			
			else {
				product.setLike(0);
			}
			
			//찜 카운트
			Map<String, Object> count = new HashMap<String, Object>(); 
			count.put("UP_ID", product.getITEM_ID());
			Map<String, Object> num = likeService.countLike(count);
			
			int likeC = Integer.parseInt(String.valueOf(num.get("COUNT(*)")));
			
			System.out.println("likeC" + likeC);

			if(likeC != 0) {
				product.setCount(likeC); } 
			else {
				product.setCount(0);
			}
			
			int re_item = Integer.parseInt(String.valueOf(product.getITEM_ID()));
			
			reviewList = productService.reviewList(re_item);

			model.addAttribute("productBean", product);
			model.addAttribute("review", reviewList);
			model.addAttribute("product", map);
			
			System.out.println(product.getITEM_CONT());
			
			
			//상품의 리뷰작성을 위한 자격 검증
			//로그인한 상태일 경우,로그인한 회원의 해당 상품의 주문상태(ORDER_STATE)를 불러오는 과정.
			if(session.getAttribute("MEM_ID") != null ) {
				
				//session으로부터 MEM_ID를 받고, product로부터 ITEM_ID를 받아서 OrderBean 주입.
				order.setORDER_MEM((String)session.getAttribute("MEM_ID"));
				order.setORDER_NO(Integer.parseInt(String.valueOf(product.getITEM_ID())));
				//주입한 값으로 ORDER_STATE를 찾아 orderState에 저장.
				int stateNum = orderService.selectOrderState(order);
				System.out.println("orderState: " + stateNum);
				
				if(stateNum != 0) {
					//orderBean에 ORDER_STATE 저장.
					model.addAttribute("stateNum", stateNum);
					}
				}
			
			return "product/productDetail";
		}
		
	}

	

