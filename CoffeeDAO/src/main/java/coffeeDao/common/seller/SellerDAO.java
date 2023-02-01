package coffeeDao.common.seller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("sellerDAO")
public class SellerDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	public Map<String, Object> selectSellerId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("seller.selectSellerId", map);
	}
	
	// 회원가입
	public void insertSeller(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("seller.insertSeller", map);
	}
	
	//업체회원 아이디 찾기
		public List<Map<String, Object>> selectSellerFindId(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectList("seller.sellerFindId", map);
		}
		
		public List<Map<String, Object>> selectSellerIdPhone(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectList("seller.sellerFindIdPhone", map);
		}

		//업체회원 비밀번호 찾기
		public List<Map<String, Object>> selectSellerPw(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectList("seller.sellerFindPw", map);
		}
		
		// 업체 정보 수정 - 선택
		public Map<String, Object> detailSeller(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("seller.detailSeller", map);
		}

		// 업체 정보 수정 - 수정
		public void modifySeller(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.update("seller.modifySeller", map);
		}
		
		// 업체 탈퇴
		public void deleteSeller(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.update("seller.deleteSeller", map);
		}
		
		
		public List<Map<String,Object>> sellerList(Map<String,Object> map){
			return sqlSessionTemplate.selectList("seller.sellerList", map);
		}
		
		public Map<String,Object> sellerListCount() throws Exception{
			return sqlSessionTemplate.selectOne("seller.sellerListCount");
		}
		
		public List<Map<String,Object>> adminSellerList(Map<String,Object> map) throws Exception{
			return sqlSessionTemplate.selectList("admin.adminSellerList", map);
		}
		
		public int countSeller(Map<String,Object>map) throws Exception{
			return sqlSessionTemplate.selectOne("admin.countSeller", map);
		}
		
		public void adminSellerValidate(Map<String,Object> map) throws Exception {
			sqlSessionTemplate.update("admin.adminSellerValidate", map);
		}
		
		public List<Map<String,Object>> adminNonValidatedSeller(Map<String,Object>map){
			return sqlSessionTemplate.selectList("admin.adminNonValidatedSeller", map);
		}
		
		public List<Map<String, Object>> sellerOrderList(Map<String, Object> map) throws Exception{
			return sqlSessionTemplate.selectList("seller.selectOrderList", map);
		}
		
		public int countSellerOrder(Map<String, Object> map) throws Exception{
			return sqlSessionTemplate.selectOne("seller.countSelectOrder", map);
		}
		
		public void stateUpdate(Map<String,Object>map) throws Exception{
			sqlSessionTemplate.update("seller.stateUpdate", map);
		}
}
