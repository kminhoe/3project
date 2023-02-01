package coffeeDao.common.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coffeeDao.model.MemberBean;
//import lombok.extern.log4j.Log4j;

@Service("joinService")
//@Log4j
public class JoinServiceImpl implements JoinService {

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	// 회원가입
	@Override
	public void insertMember(MemberBean member) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("MEM_ID", member.getMEM_ID());
		map.put("MEM_PWD", member.getMEM_PWD());
		map.put("MEM_NAME", member.getMEM_NAME());
		map.put("MEM_EMAIL", member.getMEM_EMAIL());
		map.put("MEM_ADDR1", member.getMEM_ADDR1());
		map.put("MEM_ADDR2", member.getMEM_ADDR2());
		map.put("MEM_ZP", member.getMEM_ZP());
		map.put("MEM_PHONE", member.getMEM_PHONE());
		
		memberDAO.insertMember(map);
	}
	
	@Override
	// 아이디 중복확인, 로그인 기능, 회원정보수정폼
	public Map<String, Object> selectMemberId(MemberBean member) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("MEM_ID", member.getMEM_ID());
		
		return memberDAO.selectMemberId(map);
	}
}
