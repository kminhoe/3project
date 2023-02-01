package coffeeDao.common.order;

import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import coffeeDao.common.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	// 주문 등록
		public void insertOrder(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("order.insertOrder", map);
		}

		// 바로주문 insert
		public void putOrder(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("order.putOrder", map);
		}

		// 바로주문 item
		@SuppressWarnings("unchecked")
		public Map<String, Object> selectItem(int Num) throws Exception {
			return (Map<String, Object>)sqlSessionTemplate.selectOne("order.selectItem", Num);
		}

		// 결제
		public void insertPayment(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("order.insertPayment", map);
		}

		// cart 리스트
		public void deleteList(Map<String, Object> map) throws Exception {
			delete("order.deleteList", map);
		}
		
		//ORDER_STATE 조회
				public int selectOrderState(Map<String, Object> map) throws Exception {
					return sqlSessionTemplate.selectOne("order.selectOrderState", map);
				}
}
