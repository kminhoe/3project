package coffeeDao.common.cart;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import coffeeDao.common.common.dao.AbstractDAO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cartList(String id) throws Exception {
		return (List<Map<String, Object>>) selectList("cart.cartList", id);
	}

	// 장바구니 삭제
	public void cartDelete(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.delete("cart.cartDelete", map);
	}

	// 찜하기
	public void putLike(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("likes.putLike", map);
	}

	// 체크박스 check
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNum(int Num) throws Exception {
		return (List<Map<String, Object>>) selectList("cart.selectNum", Num);
	}

	// 체크박스 not check
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNot(int Num) throws Exception {
		return (List<Map<String, Object>>) selectList("cart.selectNot", Num);
	}
	
	// 장바구니 담기(생성)
		public void insertCart(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("cart.insertCart", map);
		}

	

}
