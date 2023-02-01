package coffeeDao.common.community;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.common.CommandMap;
import coffeeDao.model.FreeTalkBean;

@Controller
public class BoardController {
	
	@Resource(name = "freeTalkService")
	private FreeTalkService freeTalkService;
	
	
	// 자유 게시판 리스트
		@RequestMapping(value = "/freeTalkList.da")
		public String freeTalkList(PagingVO pagingVO, Model model,
				@RequestParam(value="type", required=false) String type,
				@RequestParam(value="keyword", required=false) String keyword,
				@RequestParam(value="nowPage", required=false) String nowPage,
				@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception {
			
			List<Map<String, Object>> freeTalkListView = new ArrayList<Map<String, Object>>();

			// 페이지 값이 null 기본 값으로 변경
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}

			// 게시판 타입이  null 이면 F 변
			if (type == null) { type = "N"; }
			if (keyword == null) { keyword = ""; }
			
			int total = freeTalkService.countBoard(type, keyword); // 전체 게시글 수 불러오기
			
			// 페이징 VO 객체 생성
			pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
			
			freeTalkListView = freeTalkService.freeTalkList(pagingVO); // 게시판 리스트 불러오기

			model.addAttribute("paging", pagingVO); // 페이징 VO 객체
			model.addAttribute("freeTalkList", freeTalkListView); // 게시판 리스트 뷰
			model.addAttribute("type", type);
			
			return "/community/freeTalkList";
		}
	
	// 자유 게사판 글쓰기 폼
	@RequestMapping(value = "/freeTalkWriteForm.da")
	public String freeTalkWriteForm(Model model, @RequestParam(value="type", required=false) String type) throws Exception {
		
		// type 파라미터가 null 이면 경우 게시판 페이지로 리턴
		if (type == null) {
			return "freeTalkList.da";
		}
		
		model.addAttribute("type", type); // 게시판 타입

		return "community/freeTalkWriteForm";
	}
	
	// 자유 게시판 글쓰기 성공
	@RequestMapping(value = "/freeTalkWrite.da")
	public String freeTalkWrite(FreeTalkBean freeTalkBean, HttpServletRequest req) throws Exception {
		
		MultipartFile uploadFile = freeTalkBean.getBO_IMAGE_FILE();
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("MEM_ID");
		String path = req.getSession().getServletContext().getRealPath("resources/img/"); // 저장할 파일 절대 경로
//		String ext = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1); // 파일 확장자명
		
		freeTalkBean.setBO_MEMID(id); // 나중에 아이디 세션 입력
		
		
		if (!uploadFile.isEmpty()) {
			long t = System.currentTimeMillis(); // 시간
			int r = (int)(Math.random() * 1000000); // 랜덤 숫자
			
			String fileName = t + r + "_" + id + "_" + uploadFile.getOriginalFilename(); // 파일 이름
			uploadFile.transferTo(new File(path + fileName)); // 업로드한 파일 저장
			freeTalkBean.setBO_IMAGE(fileName); // 파일 이름 저장
		} else {
			freeTalkBean.setBO_IMAGE(""); // 파일 첨부가 없으면 Null
		}
		
		freeTalkService.freeTalkWrite(freeTalkBean);
		
		return "redirect:/freeTalkList.da?type=" + freeTalkBean.getBO_TYPE();
	}
	
	@RequestMapping(value="/freeTalkDetail.da")
	public ModelAndView freeTalkDetail(FreeTalkBean freeTalkBean, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView("/community/freeTalkDetail");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("MEM_ID");
		
		Map<String,Object> map = freeTalkService.freeTalkDetail(freeTalkBean);
		mv.addObject("BO_IDX", freeTalkBean.getBO_IDX());
		mv.addObject("map", map);
		mv.addObject("MEM_ID", id);
		
		return mv;
	}
	
	@RequestMapping(value="/freeTalkModify.da")
	public ModelAndView freeTalkModify(FreeTalkBean freeTalkBean, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("/community/freeTalkModify");
		Map<String,Object> map = freeTalkService.freeTalkDetail(freeTalkBean);
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/freeTalkModifyPro.da", method= {RequestMethod.POST})
	public ModelAndView freeTalkModifyPro(CommandMap commandMap, HttpServletRequest req, @RequestParam("BO_IMAGE_FILE") MultipartFile uploadFile, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/freeTalkDetail.da");
		
		String path = req.getSession().getServletContext().getRealPath("resources/img/"); // 저장할 파일 절대 경로
		String id = (String)session.getAttribute("MEM_ID");
		
		System.out.println("uploadFile : " + uploadFile);
		
		if (!uploadFile.isEmpty()) {
			long t = System.currentTimeMillis(); // 시간
			int r = (int)(Math.random() * 1000000); // 랜덤 숫자
			
			String fileName = t + r + "_" + id + "_" + uploadFile.getOriginalFilename(); // 파일 이름
			uploadFile.transferTo(new File(path + fileName)); // 업로드한 파일 저장
			commandMap.put("BO_IMAGE", fileName);
		} else {
			commandMap.put("BO_IMAGE", ""); // 파일 첨부가 없으면 Null
		}
		
		freeTalkService.freeTalkModify(commandMap.getMap());
		mv.addObject("BO_IDX",commandMap.get("BO_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/freeTalkDelete.da")
	public ModelAndView freeTalkDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/freeTalkList.da");
		freeTalkService.freeTalkDelete(commandMap.getMap());
		return mv;
	}
}
