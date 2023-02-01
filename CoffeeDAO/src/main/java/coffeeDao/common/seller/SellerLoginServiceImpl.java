package coffeeDao.common.seller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import coffeeDao.model.SellerBean;



@Service("sellerLoginService")
public class SellerLoginServiceImpl implements SellerLoginService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sellerDAO")
	private SellerDAO sellerDAO;

	@Override
	public Map<String, Object> selectSellerId(SellerBean seller) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SELL_ID", seller.getSELL_ID());
		
		return sellerDAO.selectSellerId(map);
	}

}
