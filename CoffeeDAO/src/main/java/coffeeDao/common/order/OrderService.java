package coffeeDao.common.order;


import java.util.Map;

import coffeeDao.model.CartBean;
import coffeeDao.model.OrderBean;


public interface OrderService {

	public void insertOrder(Map<String, Object> map) throws Exception; // 주문
	public void putOrder(CartBean cart) throws Exception; // 바로주문
	public Map<String, Object> selectItem(int num) throws Exception; //바로주문 선택
    public void insertPayment(Map<String, Object> map) throws Exception; // 결제
    public void deleteList(Map<String, Object> map) throws Exception; //리스트 삭제
    
    public int selectOrderState(OrderBean order) throws Exception;//구매정보 확인
	
}
