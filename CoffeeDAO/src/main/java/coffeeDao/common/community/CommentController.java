package coffeeDao.common.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import coffeeDao.model.CommentBean;

@Controller
public class CommentController {

	@Resource(name = "freeTalkService")
	private FreeTalkService freeTalkService;
	

	// 댓글 리스트
	@RequestMapping(value="/selectComment.da", method= {RequestMethod.POST})
	@ResponseBody
	public List<Map<String,Object>> selectComment(Model model, @RequestParam(value = "idx", required = false) int idx) throws Exception {

		// idx = 게시글 번호
		List<Map<String,Object>> CommentMap = freeTalkService.commentList(idx);

		model.addAttribute("CommentMap", CommentMap);
		return CommentMap;
	}
	
	// 댓글 작성
	@RequestMapping(value="/insertComment.da", method= {RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertComment(@RequestBody Map<String, Object> commentMap) throws Exception {
		
		Map<String,Object> result = new HashMap<String, Object>();
		CommentBean commentBean = new CommentBean();
		
		try {
			
			commentBean.setCOM_ARTNO(Integer.parseInt(String.valueOf((commentMap.get("COM_ARTNO")))));
			commentBean.setCOM_REF(Long.parseLong(String.valueOf((commentMap.get("COM_REF")))));
			commentBean.setCOM_WRITER(String.valueOf(commentMap.get("COM_WRITER")));
			commentBean.setCOM_CONT(String.valueOf(commentMap.get("COM_CONT")));
			commentBean.setCOM_IDX(Integer.parseInt(String.valueOf((commentMap.get("COM_IDX")))));
			commentBean.setCOM_STEP(Integer.parseInt(String.valueOf((commentMap.get("COM_STEP")))));
			commentBean.setCOM_LEVEL(Integer.parseInt(String.valueOf((commentMap.get("COM_LEVEL")))));
			
			Long ref = 1L; // COM_REF
			int step = 0; // COM_STEP
			
			if (commentBean.getCOM_REF() == 0L) { // 새로운 부모의 댓글 작성시 기본값 '0' 으로 받음
				if (freeTalkService.getMaxIdx() == null) {
					ref = 1L; // 게시글에 댓글이 존재하지 않으면 COM_REF 값을 '1' 저장
				} else {
					ref = freeTalkService.getMaxIdx() + 1L; // 게시글에 댓글이 존재하면 댓글 총 개수를 리턴받아 REF + 1 값에 저장
				}

				commentBean.setCOM_REF(ref); // REF 값을 자바빈에 저장
				
			} else if (commentBean.getCOM_REF() != 0L) { // 새로운 부모의 댓글이 아닐 경우 (대댓글)
				step = commentBean.getCOM_STEP() + 1; // 상위 댓글의 STEP 에서 1 증가
				commentBean.setCOM_STEP(step); // 자바빈에 STEP 저장

				if (freeTalkService.countRef(commentBean) > 1) { // 해당 그룹(REF)의 총 개수가 1보다 크면	
					freeTalkService.updateRestep(commentBean); // 대댓글 작성시 해당 댓글 보다 큰 STEP의 값을 1씩 증가
				}
			}
			freeTalkService.insertComment(commentBean); // 댓글 작성
			
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		 
		return result;
	}
	
	@RequestMapping(value = "/updatecomment.da", method= RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateComment(@RequestBody Map<String, Object> map) throws Exception{
		Map<String, Object> result = new HashMap<>();
		
		
		try {
			freeTalkService.updateComment(map);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		return result;
	}
	
	@RequestMapping(value = "/deletecomment.da", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestParam("COM_IDX") int COM_IDX) throws Exception{
		Map<String, Object> result = new HashMap<>();
		
		try {
			freeTalkService.deleteComment(COM_IDX);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		
		return result;
		
		
	}
	
}
