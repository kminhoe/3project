package coffeeDao.common.seller;

import java.io.File;
import java.util.ArrayList;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.common.CommandMap;
import coffeeDao.common.common.Paging;
import coffeeDao.model.MapToBean;
import coffeeDao.model.SellerBean;

@Controller
public class SellerController {

	@Resource(name = "sellerJoinService")
	private SellerJoinService sellerJoinService;
	
	@Resource(name = "sellerLoginService")
	private SellerLoginService sellerLoginService;
	
	@Resource(name = "sellerService")
	private SellerService sellerService;
	
	
		//SELLER 리스트 
		@RequestMapping(value = "/sellerList.da")
		public String sellerList(Model model, HttpServletRequest req) throws Exception {
			int pageSize = 9;
			int START = 1;
			int END = pageSize;
			int currentPage = 1;
			
			int listCount;
			int pageBlock = 10;
			String url = "sellerList.da";
			String searchUrl = "";
			
			if(req.getParameter("page")!=null) {
				currentPage = Integer.parseInt(req.getParameter("page"));
				START = 1 + pageSize*(currentPage-1);
				END = pageSize*currentPage;
			}
			
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			List<SellerBean> sellerBeanList = new ArrayList<SellerBean>();
			list = sellerService.sellerList(START,END);
			
			listCount = sellerService.sellerListCount();
			
			Paging paging = new Paging(listCount, pageBlock, pageSize, currentPage, url, searchUrl);
			
			for(Map<String,Object> mapObject : list) {
				sellerBeanList.add(MapToBean.mapToSeller(mapObject));
			}
			
			model.addAttribute("sellerBeanList", sellerBeanList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("paging", paging);
			
			return "seller/sellerList";
		}
		
		@RequestMapping(value="/sellerDetail.da")
		public ModelAndView sellerDetail(SellerBean seller, Model model, HttpSession session) throws Exception {
			
			ModelAndView mv = new ModelAndView("/seller/sellerDetail");

			Map<String, Object> map = sellerService.detailSeller(seller);

			mv.addObject("map", map);

			return mv;
		}
		
	
		// 회원가입 폼
		@RequestMapping(value = "/sellerRegisterForm.da")
		public String sellerRegisterForm() throws Exception {
			return "seller/sellerRegisterForm";
		}
	
	
	
	// 회원가입
		@RequestMapping(value = "/sellerRegister.da")
		public String insertSuccess(SellerBean seller, HttpServletRequest request) throws Exception {

			MultipartFile profUploadFile = seller.getSELL_PROF_UPLOADFILE();
			List<MultipartFile> imageUploadFile = seller.getSELL_IMAGE_UPLOADFILE();
			String fileNames = ""; int i = 1;

			 // 저장할 파일 절대 경로
//			String path = "/Users/gjy/Documents/workspace-sts-3.9.18.RELEASE/CoffeeDAO/src/main/webapp/WEB-INF/uploads/";// 저장할 파일 절대 경로
			//이클립스에 해당 경로 폴더 만들기
			String path = request.getSession().getServletContext().getRealPath("resources/img/");
			
			System.out.println("경로 주소 : " + path);
			
			// 업로드한 로고 이미지 파일 존재여부 확인
			// 로고 이미지 저장 파일 이름 #{SELL_NAME}_logo_#{실제 파일명}
			if (!profUploadFile.isEmpty()) {
				String logoFileName = seller.getSELL_NAME() + "_logo_" + profUploadFile.getOriginalFilename(); // 저장할 로고 이미지 파일명

				profUploadFile.transferTo(new File(path + logoFileName)); // 업로드한 파일 저장
				seller.setSELL_PROF(logoFileName); // 자바빈에 로고 파일 이름 저장
				System.out.println(">> 로고 이미지 업로드 파일 : " + logoFileName);
			}
			
			// 업로드한 업체 이미지 파일 존재 여부 확인
			// 로고 이미지 저장 파일 이름 #{SELL_NAME}_image_#{실제 파일명}
			if (!imageUploadFile.isEmpty()) {
			    for (MultipartFile file : imageUploadFile) {
			        String imageFileName = seller.getSELL_NAME() + "_image_" + file.getOriginalFilename(); // 저장할 업체 상세 이미지 파일명
			        file.transferTo(new File(path + imageFileName)); // 업로드한 파일 저장
			    	
			        // 다중 업로드 파일 , 구분
					if (i < imageUploadFile.size()) {
				    	fileNames += imageFileName + ","; i++;
					} else {
						fileNames += imageFileName;
					}
			    }
			    seller.setSELL_IMAGE(fileNames); // 업로드한 파일 저장
			    System.out.println(">> 이미지 업로드 파일 : " + fileNames);
			}
			
			sellerJoinService.insertSeller(seller); // 회원가입 성공 SQL 입력

			return "seller/sellerLoginForm";
		}

		// 아이디 중복 체크
		@RequestMapping(value = "/sellerConfirmId.da")
		public String sellerConfirmId(SellerBean seller, Model model) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();

			// 아이디를 공백을 입력 할 경우
			if (seller.getSELL_ID().trim().equals("")) {
				model.addAttribute("msg", "아이디를 입력해주세요.");
				System.out.println(">> 아이디를 입력해주세요.");
				return "/seller/confirmId";
			}
			
			// 기업 회원 아이디 검색
			map = sellerJoinService.selectSellerId(seller);
			System.out.println(">> selectSellerId");
			
			if (map != null) {
				model.addAttribute("msg", "이미 가입된 아이디입니다.");
				System.out.println(">> " + map.get("SELL_ID") + " : 이미 가입된 아이디입니다.");
				return "/seller/confirmId";
			} else {
				// 중복된 아이디 없음
				model.addAttribute("msg", "사용할 수 있는 아이디입니다.");
				System.out.println(">> " + seller.getSELL_ID() + " : 사용할 수 있는 아이디입니다.");
			}
			return "/seller/confirmId";
		}	
		
		// 업체회원 아이디찾기
				@RequestMapping(value = "/sellerFindId.da")
				public ModelAndView sellerFindId(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindId");
					return mv;
				}

				@RequestMapping(value = "/sellerFindIdResult.da", method = RequestMethod.POST)
				public ModelAndView sellerFindIdResult(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindIdResult");
					List<Map<String, Object>> list = sellerJoinService.sellerFindId(commandMap.getMap());
					mv.addObject("list", list);
					return mv;
				}
				
				@RequestMapping(value = "/sellerFindIdPhone.da")
				public ModelAndView sellerFindIdPhone(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindIdPhone");
					return mv;
				}
				
				@RequestMapping(value = "/sellerFindIdPhoneResult.da", method = RequestMethod.POST)
				public ModelAndView sellerFindIdPhoneResult(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindIdPhoneResult");
					List<Map<String, Object>> list = sellerJoinService.sellerFindIdPhone(commandMap.getMap());
					mv.addObject("list", list);
					return mv;
				}

				// 업체회원 비밀번호 찾기
				@RequestMapping(value = "/sellerFindPw.da")
				public ModelAndView sellerFindPw(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindPw");
					return mv;
				}

				@RequestMapping(value = "/sellerFindPwResult.da", method = RequestMethod.POST)
				public ModelAndView sellerFindPwResult(CommandMap commandMap) throws Exception {
					ModelAndView mv = new ModelAndView("seller/sellerFindPwResult");
					List<Map<String, Object>> list = sellerJoinService.sellerFindPw(commandMap.getMap());
					mv.addObject("list", list);
					return mv;
				}
				
				
				
				//로그인 폼
				@RequestMapping(value = "/sellerLoginForm.da")
				public String sellerLoginForm(HttpSession session, Model model) throws Exception {
					System.out.println("로그인 폼");
					SellerBean sellerBean = new SellerBean();
					
					//세션이 있을경우 sellerMainForm으로 이동.
					if(session.getAttribute("SELL_ID") != null) {
						System.out.println("이미 판매자 로그인함");
						System.out.println(sellerBean.getSELL_ID());
						return "/seller/sellerMyPage";
					}
				
					return "/seller/sellerLoginForm";
				}
				
				//로그인 기능
				@RequestMapping(value = "/sellerLogin.da")
				public String login(SellerBean seller, HttpSession session, Model model) throws Exception {
					Map<String, Object> map = new HashMap<String, Object>();
					SellerBean sellerBean = new SellerBean();
					
					System.out.println("입력한 아이디:" + seller.getSELL_ID());
					System.out.println("입력한 패스워드:" + seller.getSELL_PWD());
					
					map = sellerLoginService.selectSellerId(seller);

					System.out.println("Session 유저: "+ seller.getSELL_ID());
					
					//등록된 아이디가 아닐 경우
					if (map == null) {
						// 로그인 실패
						
						System.out.println("등록된 아이디가 아닙니다!");
						
						return "/seller/sellerLoginForm";
					//등록된 아이디일 경우
					} else {
						sellerBean = MapToBean.mapToSeller(map); // 검색된 회원
						
						//입력한 비밀번호가 일치하는 경우
						if (seller.getSELL_PWD().equals(sellerBean.getSELL_PWD())) {
							// 로그인 성공

							// 회원탈퇴 여부
							if (sellerBean.getSELL_STATE().equals(0)) {
								return "/seller/sellerLoginForm";
							}

							// 세션 등록
							session.setAttribute("SELL_ID", sellerBean.getSELL_ID());
							
						//입력한 비밀번호가 일치하는 경우
						} else {
							System.out.println("비밀번호 틀림!");
							return "/seller/sellerLoginForm";
						}
					}
					System.out.println("로그인 성공!");
					return "redirect:/sellerMyPage.da";
				}
				
//					@RequestMapping(value = "/sellerMainForm.da")
//					public String sellerMainForm(Model model) {
//						System.out.println("업체메인으로 이동");
//					return "seller/sellerMainForm";
//					}
				
					@RequestMapping(value = "/sellerLogout.da")
					public String logout(HttpServletRequest request, Model model) throws Exception {
						request.getSession().invalidate();
						return "redirect:/sellerLoginForm.da";
					}
					
					//회원 정보 수정
					@RequestMapping(value = "/sellerMyPage.da")
					public ModelAndView sellerMyPage(SellerBean seller, Model model, HttpSession session) throws Exception {
						
						ModelAndView mv = new ModelAndView("/seller/sellerMyPage");
						
				        
						String SELL_ID = (String)session.getAttribute("SELL_ID");
						
						seller.setSELL_ID(SELL_ID);

						Map<String, Object> map = sellerService.detailSeller(seller);

						mv.addObject("map", map);

						return mv;
						
					}
					
					@RequestMapping(value = "/sellerModifyForm.da")
					public ModelAndView sellerModifyForm(SellerBean seller, Model model, HttpSession session) throws Exception {
						
						ModelAndView mv = new ModelAndView("/seller/sellerModifyForm");

						String SELL_ID = (String)session.getAttribute("SELL_ID");
						
						seller.setSELL_ID(SELL_ID);

						Map<String, Object> map = sellerService.detailSeller(seller);

						mv.addObject("map", map);

						return mv;
						

					}
					
					@RequestMapping(value = "/sellerModifyPro.da", method = { RequestMethod.POST })
					public ModelAndView sellerModifyPro(SellerBean seller, HttpSession session, HttpServletRequest request, MultipartHttpServletRequest image) throws Exception {
						
						Map<String, Object> map = new HashMap<String, Object>();
						
						MultipartFile sell_prof = image.getFile("SELL_PROF_UPLOADFILE");
						System.out.println("이미지 이름 : " + sell_prof.getOriginalFilename());
						String SELL_PROF = seller.getSELL_NAME() + "_logo_" + sell_prof.getOriginalFilename();
						map.put("SELL_PROF", SELL_PROF);
						
						
						//멀티 이미지 받기
						List<MultipartFile> sell_image = image.getFiles("SELL_IMAGE_UPLOADFILE");

						//이클립스에 해당 경로 폴더 만들기
						String path2 = request.getSession().getServletContext().getRealPath("resources/img/");
						System.out.println("경로 주소 : " + path2);
						

						
						 File f = new File(path2);
						  
						  //폴더 없으면 만들기 
						 if(!f.exists()) { 
							 f.mkdir(); 
							 } else {
						 }
						  System.out.println("폴더가 존재합니다"); 
						  
						  //파일 저장 
						  
						  sell_prof.transferTo(new File(path2 + SELL_PROF));
						  
						  for (MultipartFile mf : sell_image) {
						 
						  String SELL_IMAGE = seller.getSELL_NAME() + "_image_" + mf.getOriginalFilename();
						  
						  mf.transferTo(new File(path2 + SELL_IMAGE));
						  
						  }
						 
						
						ModelAndView mv = new ModelAndView("redirect:/sellerMyPage.da");


						sellerService.modifySeller(seller, image);

						mv.addObject("SELL_ID", "아이디1");

						System.out.println("커맨드 값 : " );

						return mv;
					}

					//업체 탈퇴
					@RequestMapping(value = "/sellerDelete.da")
					public ModelAndView sellerDelete(SellerBean seller, Model model, HttpServletRequest req) throws Exception {

						
						ModelAndView mv = new ModelAndView("redirect:/sellerLoginForm.da");
						
						sellerService.deleteSeller(seller);
						req.getSession().invalidate();
						
						return mv;
					}	
					
	}
