package coffeeDao.common.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import coffeeDao.model.qnaBean;

@Controller
public class CSController {

	@Resource(name = "inquiryService")
	private InquiryService inquiryService;



	// 리스트 페이지
	@RequestMapping(value = "/inquiryList.da")
	public ModelAndView inquiryListPage(HttpSession session, HttpServletResponse response, Criteria cri) throws Exception {

		ModelAndView mv = new ModelAndView("/inquiry/inquiryList");
        String id = (String)session.getAttribute("MEM_ID");
        
		// 총 게시물 수
		int total = inquiryService.count(cri);

		List<Map<String, Object>> list = inquiryService.inquiryListPage(cri);

		pageDTO page = new pageDTO(cri, total);

		mv.addObject("inquiryList", list);
		mv.addObject("page", page);
		mv.addObject("id", id);

		return mv;

	}
	
	// 글 상세보기
	@RequestMapping(value = "/inquiryDetail.da")
	public ModelAndView inquiryDetail(HttpSession session, 
			HttpServletResponse response, int QA_IDX, Criteria cri) throws Exception {
		
		String id = (String)session.getAttribute("MEM_ID");
		
		ModelAndView mv = new ModelAndView("/inquiry/inquiryDetail");
		
		Map<String, Object> detail = inquiryService.inquiryDetail(QA_IDX);
		
		System.out.println(detail);
		mv.addObject("detail", detail);
		mv.addObject("id", id);
		mv.addObject("cri", cri);
		
		return mv;
		
	}
	
	// 글 작성
	@RequestMapping(value = "/inquiryWriteForm.da")
	public ModelAndView inquiryWriteForm(HttpSession session, 
			HttpServletResponse response, Criteria cri) throws Exception {
		
		ModelAndView mv = new ModelAndView("/inquiry/inquiryWriteForm");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/inquiryWrite.da")
	public ModelAndView inquiryWrite(HttpSession session, 
			HttpServletResponse response, qnaBean qa, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/inquiryList.da");

		  inquiryService.inquiryWrite(qa,session,request);
		  
		return mv;
		
	}
	
	// 글 수정
	@RequestMapping(value = "/inquiryUpdateForm.da")
	public ModelAndView inquiryUpdateForm(HttpSession session, 
			HttpServletResponse response, int QA_IDX, Criteria cri) throws Exception {
		
		ModelAndView mv = new ModelAndView("/inquiry/inquiryUpdateForm");
		
		String id = (String)session.getAttribute("MEM_ID");
		
		Map<String, Object> detail = inquiryService.inquiryDetail(QA_IDX);
		mv.addObject("detail", detail);
		mv.addObject("id", id);
		mv.addObject("cri", cri);
		
		return mv;
		
	}
	
	@RequestMapping(value = "/inquiryUpdate.da")
	public ModelAndView inquiryUpdate(HttpSession session, 
			HttpServletRequest request, int QA_IDX, Criteria cri,qnaBean qa) throws Exception {
		System.out.println("여기까지 오는지 확인");
		
		ModelAndView mv = new ModelAndView("redirect:/inquiryList.da");
		
		inquiryService.inquiryUpdate(qa, session, request);

		
		return mv;
		
	}
	
	
	// 글 삭제
	@RequestMapping(value = "/inquiryDelete.da")
	public ModelAndView inquiryDelete(HttpSession session, 
			HttpServletResponse response, Criteria cri, qnaBean qa) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/inquiryList.da");
		
		inquiryService.inquiryDelete(qa.getQA_IDX());
		
		return mv;
		
	}

}
