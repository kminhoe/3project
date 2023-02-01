 package coffeeDao.common.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회원가입
	public void insertMember(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("member.registerMember", map);
	}
	
	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.selectMemberId", map);
	}
	
	public Map<String, Object> selectKakaoId(String id) {
		//printQueryId(queryId);
		return sqlSessionTemplate.selectOne("member.selectKakaoId", id);
	}
	
	public List<Map<String, Object>> selectId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.findId", map);
	}
	
	public List<Map<String, Object>> selectIdPhone(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.findIdPhone", map);
	}

	public List<Map<String, Object>> selectPw(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.findPw", map);
	}
	
	//회원정보 수정 회원 - 선택
	public Map<String, Object> detailMember(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.detailMember", map);	
	}
			
	//회원 정보 수정  - 수정
	public void updateMember(Map<String,Object> map) throws Exception {
	    sqlSessionTemplate.update("member.updateMember", map);
	}
	
	public void deleteMember(Map<String,Object> map) throws Exception{
		sqlSessionTemplate.update("member.deleteMember", map);
	}
	
	public List<Map<String,Object>> memberList(Map<String,Object>map) throws Exception{
		return sqlSessionTemplate.selectList("admin.memberList", map);
	}
	
	public int countMember(Map<String,Object>map)throws Exception{
		return sqlSessionTemplate.selectOne("admin.countMember", map);
	}
	
	// 일반회원 > 마이페이지 > 주문내역 > 날짜 조회
	public List<Map<String, Object>> orderHistory(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.selectOrder", map);	
	}
	
	// 일반회원 > 마이페이지 > 주문내역 > 상태변경
	public void orderState(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.update("member.orderState", map);
	}
		
	// 일반회원 > 마이페이지 > 리뷰보기
	public List<Map<String, Object>> myReview(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.selectMyReview", map);	
	}
	
	// 일반회원 > 마이페이지 > 찜목록
	public List<Map<String, Object>> myPutLike(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectList("member.selectMyPutLike", map);	
	}
}