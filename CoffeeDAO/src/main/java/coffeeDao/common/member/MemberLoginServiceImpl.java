package coffeeDao.common.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import coffeeDao.model.MemberBean;



@Service("memberService")
public class MemberLoginServiceImpl implements MemberLoginService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public Map<String, Object> selectKakaoId(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectKakaoId(id);
	}
	
	@Override
	public Map<String, Object> selectMemberId(MemberBean member) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("MEM_ID", member.getMEM_ID());
		
		return memberDAO.selectMemberId(map);
	}
	
	@Override
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		return memberDAO.selectId(map);
	}
	
	@Override
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		return memberDAO.selectPw(map);
	}
	
	public List<Map<String, Object>> findIdPhone(Map<String, Object> map) throws Exception {
		return memberDAO.selectIdPhone(map);
	}

	

}
