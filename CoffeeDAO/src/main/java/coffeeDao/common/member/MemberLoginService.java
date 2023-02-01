package coffeeDao.common.member;

import java.util.List;
import java.util.Map;

import coffeeDao.model.MemberBean;


public interface MemberLoginService {
	
	public Map<String, Object> selectKakaoId(String id) 
			throws Exception;
	
	public Map<String, Object> selectMemberId(MemberBean member) throws Exception;
	
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> findIdPhone(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception;
	

}
