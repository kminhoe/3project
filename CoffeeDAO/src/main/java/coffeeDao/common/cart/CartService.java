package coffeeDao.common.cart;

import java.util.List;
import java.util.Map;



import coffeeDao.model.CartBean;



public interface CartService {
	
	public void insertCart(CartBean cart) throws Exception; // 회원가입
	
	public List<Map<String, Object>> cartList(String id) throws Exception; //리스트
	
	public void cartDelete(CartBean cartBean) throws Exception; //삭제
	
	
	public void selectNum(int Num) throws Exception;//선택 인덱스
	
	public void selectNot(int Num) throws Exception;//선택되지 않은 idx 값


}
