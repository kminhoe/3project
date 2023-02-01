package coffeeDao.common.main;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String, Object>> bestItemList() throws Exception; // 베스트 상품 불러오기
	public List<Map<String, Object>> bestSellerList() throws Exception; // 베스트 업체 불러오기
}
