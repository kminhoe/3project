package coffeeDao.common.seller;

import java.util.Map;

import coffeeDao.model.SellerBean;


public interface SellerLoginService {

	public Map<String, Object> selectSellerId(SellerBean seller) throws Exception;

}
