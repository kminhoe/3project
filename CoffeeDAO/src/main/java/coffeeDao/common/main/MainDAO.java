package coffeeDao.common.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 베스트 상품 리스트
	public List<Map<String, Object>> bestItemList() throws Exception {
		return sqlSessionTemplate.selectList("product.bestItemList");
	}
	
	// 베스트 업체 리스트
	public List<Map<String, Object>> bestSellerList() throws Exception {
		return sqlSessionTemplate.selectList("seller.bestSellerList");
	}
}
