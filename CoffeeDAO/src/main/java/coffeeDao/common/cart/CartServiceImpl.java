package coffeeDao.common.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.CartBean;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Resource(name = "cartDAO")
	private CartDAO cartDAO;

	@Override
	public List<Map<String, Object>> cartList(String id) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.cartList(id);
	}
	
	@Override
	public void insertCart(CartBean cart) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("CART_NAME", cart.getCART_NAME());
		map.put("CART_ID", cart.getCART_ID());
		map.put("CART_PRICE", cart.getCART_PRICE());
		map.put("CART_MEM", cart.getCART_MEM());
		map.put("CART_COUNT", cart.getCART_COUNT());
		map.put("CART_TOT", cart.getCART_TOT());
		map.put("CART_GRIND", cart.getCART_GRIND());
		
		cartDAO.insertCart(map);
	}

	@Override
	public void cartDelete(CartBean cartBean) throws Exception {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("CART_IDX", cartBean.getCART_IDX());

		cartDAO.cartDelete(map);
	}


	@Override
	public void selectNum(int Num) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.selectNum(Num);
	}

	@Override
	public void selectNot(int Num) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.selectNot(Num);
	}



}
