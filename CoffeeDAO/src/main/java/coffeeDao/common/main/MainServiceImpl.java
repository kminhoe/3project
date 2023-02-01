package coffeeDao.common.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name = "mainDAO")
	private MainDAO productDAO;
	
	@Override
	public List<Map<String, Object>> bestItemList() throws Exception {
		return productDAO.bestItemList();
	}

	@Override
	public List<Map<String, Object>> bestSellerList() throws Exception {
		return productDAO.bestSellerList();
	}
}
