package coffeeDao.common.order;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.CartBean;
import coffeeDao.model.OrderBean;


@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;
	
	@Override
	public void insertOrder(Map<String, Object> map) throws Exception {
		
		orderDAO.insertOrder(map);
		
	}

	
	
	
	@Override
	public void putOrder(CartBean cart) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("CART_NAME", cart.getCART_NAME());
		map.put("CART_ID", cart.getCART_ID());
		map.put("CART_PRICE", cart.getCART_PRICE());
		map.put("CART_MEM", cart.getCART_MEM());
		map.put("CART_COUNT", cart.getCART_COUNT());
		map.put("CART_GRIND", cart.getCART_GRIND());	
		
		orderDAO.putOrder(map);
		
	}
	
	





	@Override
	public Map<String, Object> selectItem(int num) throws Exception {
		// TODO Auto-generated method stub
		
		return orderDAO.selectItem(num);
	}




	@Override
	public void insertPayment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		orderDAO.insertPayment(map);
	}

	
	@Override
	public void deleteList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		orderDAO.deleteList(map);
	}


	@Override
	public int selectOrderState(OrderBean order) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ORDER_MEM", order.getORDER_MEM());
		map.put("ORDER_NO", order.getORDER_NO());
		
		return orderDAO.selectOrderState(map);
	}
	
	
	
	
	

}


	
	
	
	
	
	


