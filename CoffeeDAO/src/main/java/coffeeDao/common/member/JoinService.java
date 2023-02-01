package coffeeDao.common.member;

import java.util.Map;

import coffeeDao.model.MemberBean;

public interface JoinService {
	public void insertMember(MemberBean member) throws Exception; // 회원가입
	public Map<String, Object> selectMemberId(MemberBean member) throws Exception; // 아이디 확인
}
