package coffeeDao.common.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import coffeeDao.common.cart.CartDAO;
import coffeeDao.model.LikeBean;

@Service("likeService")
public class LikeServiceImpl implements LikeService {
	
	@Override
	public List<Map<String, Object>> likeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return likeDAO.likeList(map);
	}


	@Resource(name = "likeDAO")
	private LikeDAO likeDAO;
	
	@Override
	public void putLike(LikeBean likesBean, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		//System.out.println("up_id" + likesBean.getUP_ID());
		map.put("UP_ID", likesBean.getUP_ID());
		
		likesBean.setUP_MEM((String)session.getAttribute("MEM_ID"));
		map.put("UP_MEM", session.getAttribute("MEM_ID"));
		map.put("UP_COUNT", (Integer)likesBean.getUP_COUNT());
		System.out.println("UP_MEM"+ session.getAttribute("MEM_ID"));

		likeDAO.putLike(map);
	}

	@Override
	public Map<String, Object> selectLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		return likeDAO.selectLike(map);
	}

	@Override
	public void deleteLike(LikeBean likesBean, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("UP_ID", likesBean.getUP_ID());
		
		likesBean.setUP_MEM((String)session.getAttribute("MEM_ID"));
		map.put("UP_MEM", session.getAttribute("MEM_ID"));
		System.out.println("UP_MEM"+ session.getAttribute("MEM_ID"));
		
		likeDAO.deleteLike(map);
		
	}
	

	@Override
	public Map<String, Object> countLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return likeDAO.countLike(map);
	}
	
	
	
	
	
	

}
