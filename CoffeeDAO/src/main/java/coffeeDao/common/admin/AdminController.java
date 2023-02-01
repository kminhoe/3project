package coffeeDao.common.admin;

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
import coffeeDao.common.community.FreeTalkService;
import coffeeDao.common.community.PagingVO;
import coffeeDao.common.member.MypageService;
import coffeeDao.common.qna.qnaService;
import coffeeDao.common.seller.SellerService;
import coffeeDao.model.FreeTalkBean;
import coffeeDao.model.SellerBean;
import coffeeDao.model.qnaBean;

@Controller
public class AdminController {
	
	@Resource(name = "sellerService")
	private SellerService sellerService;
	
	@Resource(name= "mypageService")
	private MypageService memberService;
	
	@Resource(name="freeTalkService")
	private FreeTalkService boardService;
	
	@Resource(name="qnaService")
	private qnaService qnaService;
	
	// member 리스트
			@RequestMapping(value = "/adminMemberList.da")
			public String adminMemberList(PagingVO pagingVO, Model model,
					@RequestParam(value="type", required=false) String type,
					@RequestParam(value="keyword", required=false) String keyword,
					@RequestParam(value="nowPage", required=false) String nowPage,
					@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception {
				
				List<Map<String, Object>> memberListView = new ArrayList<Map<String, Object>>();

				// 페이지 값이 null 기본 값으로 변경
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "10";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "10";
				}

				if (keyword == null) { keyword = ""; }
				
				int total = memberService.countMember(keyword); // 전체 게시글 수 불러오기
				
				// 페이징 VO 객체 생성
				pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
				
				memberListView = memberService.memberList(pagingVO); // 게시판 리스트 불러오기

				model.addAttribute("paging", pagingVO); // 페이징 VO 객체
				model.addAttribute("memberList", memberListView); // 게시판 리스트 뷰
				
				return "/admin/memberList";
			}
			
			// 판매자 리스트
						@RequestMapping(value = "/adminSellerList.da")
						public String adminSellerList(PagingVO pagingVO, Model model,
								@RequestParam(value="type", required=false) String type,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam(value="nowPage", required=false) String nowPage,
								@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception {
							
							List<Map<String, Object>> sellerListView = new ArrayList<Map<String, Object>>();

							// 페이지 값이 null 기본 값으로 변경
							if (nowPage == null && cntPerPage == null) {
								nowPage = "1";
								cntPerPage = "10";
							} else if (nowPage == null) {
								nowPage = "1";
							} else if (cntPerPage == null) { 
								cntPerPage = "10";
							}

							if (keyword == null) { keyword = ""; }
							
							int total = sellerService.countSeller(keyword); // 전체 게시글 수 불러오기
							
							// 페이징 VO 객체 생성
							pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
							
							sellerListView = sellerService.adminSellerList(pagingVO); // 게시판 리스트 불러오기

							model.addAttribute("paging", pagingVO); // 페이징 VO 객체
							model.addAttribute("sellerList", sellerListView); // 게시판 리스트 뷰
							
							return "/admin/adminSellerList";
						}
						
			// 판매자 승인
						@RequestMapping(value="/adminSellerValidate.da")
						public ModelAndView adminSellerValidate(SellerBean seller, Model model) throws Exception {
							ModelAndView mv = new ModelAndView("redirect:/adminSellerList.da");
							sellerService.adminSellerValidate(seller);
							return mv;
						}
						
			//게시판 공지 목록
						@RequestMapping(value = "/adminBoardList.da")
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
							type = "N";
							if (keyword == null) { keyword = ""; }
							
							int total = boardService.countBoard(type, keyword); // 전체 게시글 수 불러오기
							
							// 페이징 VO 객체 생성
							pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
							
							freeTalkListView = boardService.adminList(pagingVO); // 게시판 리스트 불러오기

							model.addAttribute("paging", pagingVO); // 페이징 VO 객체
							model.addAttribute("freeTalkList", freeTalkListView); // 게시판 리스트 뷰
							
							return "/admin/boardList";
						}
						
			// 게시판 등록
						@RequestMapping(value = "/adminNoticeWrite.da")
						public String freeTalkWrite(FreeTalkBean freeTalkBean, HttpServletRequest req) throws Exception {
							
							MultipartFile uploadFile = freeTalkBean.getBO_IMAGE_FILE();
							
							String id = "admin";
							String path = req.getSession().getServletContext().getRealPath("resources/img/"); // 저장할 파일 절대 경로
//							
							
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
							
							boardService.noticeWrite(freeTalkBean);
							
							return "redirect:/adminBoardList.da";
						}
						
						@RequestMapping(value="/adminMain.da")
						public String adminMain(PagingVO pagingVO, Model model,
								@RequestParam(value="type", required=false) String type,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam(value="nowPage", required=false) String nowPage,
								@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception {
							
							List<Map<String, Object>> sellerListView = new ArrayList<Map<String, Object>>();

							// 페이지 값이 null 기본 값으로 변경
							if (nowPage == null && cntPerPage == null) {
								nowPage = "1";
								cntPerPage = "10";
							} else if (nowPage == null) {
								nowPage = "1";
							} else if (cntPerPage == null) { 
								cntPerPage = "10";
							}

							if (keyword == null) { keyword = ""; }
							
							int total = sellerService.countSeller(keyword); // 전체 게시글 수 불러오기
							
							// 페이징 VO 객체 생성
							pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
							
							sellerListView = sellerService.adminNonValidatedSeller(pagingVO); // 게시판 리스트 불러오기

							model.addAttribute("paging", pagingVO); // 페이징 VO 객체
							model.addAttribute("sellerList", sellerListView); // 게시판 리스트 뷰
							return "admin/adminMain";
						}
						
						@RequestMapping(value = "/adminInquiryList.da")
						public String inquiryList(PagingVO pagingVO, Model model,
								@RequestParam(value="type", required=false) String type,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam(value="nowPage", required=false) String nowPage,
								@RequestParam(value="cntPerPage", required=false) String cntPerPage) throws Exception {
							
							List<Map<String, Object>> inquiryList = new ArrayList<Map<String, Object>>();

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
							type = "";
							if (keyword == null) { keyword = ""; }
							
							int total = boardService.countBoard(type, keyword); // 전체 게시글 수 불러오기
							
							// 페이징 VO 객체 생성
							pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), type, keyword);
							
							inquiryList = qnaService.adminList(pagingVO); // 게시판 리스트 불러오기

							model.addAttribute("paging", pagingVO); // 페이징 VO 객체
							model.addAttribute("inquiryList", inquiryList); // 게시판 리스트 뷰
							
							return "/admin/inquiryList";
						}
						
						@RequestMapping(value="/adminInquiryReply.da")
						public ModelAndView adminInquiryDetail(qnaBean qna, Model model) throws Exception {
							ModelAndView mv = new ModelAndView("admin/inquiryDetail");
							Map<String,Object> map = qnaService.adminQnaDetail(qna);
							mv.addObject("map", map);
							
							return mv;
						}
						
						@RequestMapping(value="/adminInquiryReplyPro.da",  method= {RequestMethod.POST})
						public ModelAndView adminInquiryDetailPro(CommandMap commandMap) throws Exception {
							ModelAndView mv = new ModelAndView("redirect:/adminInquiryList.da");
							qnaService.adminQnaReply(commandMap.getMap());
							mv.addObject("QA_IDX", commandMap.get("QA_IDX"));
							mv.addObject("QA_STATE", commandMap.get("QA_STATE"));
							return mv;
						}
						
						@RequestMapping(value="/adminInquiryDelete.da")
						public ModelAndView adminInquiryDelete(CommandMap commandMap) throws Exception {
							ModelAndView mv = new ModelAndView("redirect:/adminInquiryList.da");
							qnaService.adminQnaDelete(commandMap.getMap());
							return mv;
						}

						
						
}
