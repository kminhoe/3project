package coffeeDao.common.like;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import coffeeDao.model.LikeBean;

public interface LikeService {
	
	public void putLike(LikeBean likesBean, HttpSession session) throws Exception; //찜 추가
	
	public Map<String, Object> selectLike(Map<String, Object> map) throws Exception; //찜 유무 확인
	
	public void deleteLike(LikeBean likesBean, HttpSession session) throws Exception; //찜 추가
	
	public Map<String, Object> countLike(Map<String, Object> map) throws Exception; //count
	
	public List<Map<String, Object>> likeList(Map<String, Object> map) throws Exception; //찜 리스트
	

}
