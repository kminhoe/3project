package coffeeDao.common.member;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import coffeeDao.common.common.CommandMap;
import coffeeDao.common.like.LikeService;
import coffeeDao.model.LikeBean;
import coffeeDao.model.MapToBean;
import coffeeDao.model.MemberBean;
import coffeeDao.model.OrderBean;
import coffeeDao.model.ProductBean;

@Controller
public class MemberController {

	@Resource(name = "joinService")
	private JoinService joinService;
	
	@Resource(name = "memberService")
	private MemberLoginService memberService;
	
	@Resource(name = "mypageService")
	private MypageService mypageService;
	
	@Resource(name = "likeService")
	private LikeService likeService;
	
	//회원가입 폼 
	@RequestMapping(value = "/registerForm.da")
	public String registerForm(MemberBean member, BindingResult result, Model model) throws Exception {
		return "/member/registerMember";
	}
	
	//회원가입 성공
	@RequestMapping(value = "/register.da")
	public String register(MemberBean member, BindingResult result, Model model) throws Exception {		

		joinService.insertMember(member);
		return "redirect:/loginForm.da";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/confirmId.da")
	public String confirmId(MemberBean member, Model model) throws Exception {
			
		Map<String, Object> map = new HashMap<String, Object>();

			// 아이디를 공백을 입력 할 경우
		if (member.getMEM_ID().trim().equals("")) {
			model.addAttribute("msg", "아이디를 입력해주세요.");
			System.out.println(">> 아이디를 입력해주세요.");
			return "/member/confirmId";
		}
			
			// 멤버 아이디 검색
		map = joinService.selectMemberId(member);
		System.out.println(">> selectMemberId");
		
		if (map != null) {
			model.addAttribute("msg", "이미 가입된 아이디입니다.");
			System.out.println(">> " + map.get("MEM_ID") + " : 이미 가입된 아이디입니다.");
			return "/member/confirmId";
		} else {
			model.addAttribute("msg", "사용할 수 있는 아이디입니다.");
			System.out.println(">> " + member.getMEM_ID() + " : 사용할 수 있는 아이디입니다.");
		}
		return "/member/confirmId";
	}
	
	//로그인 폼
		@RequestMapping(value = "/loginForm.da")
		public String loginForm(HttpSession session, Model model) throws Exception {
			
			//이미 로그인상태일 경우
			if(session.getAttribute("MEM_ID") != null) {
				System.out.println("Session 유저: "+ session.getAttribute("MEM_ID"));
				System.out.println("이미 로그인상태이므로 홈으로 이동합니다.");
				return "/home";
			}
			return "/member/loginForm";
		}
		
		//로그인 기능
		@RequestMapping(value = "/login.da")
		public String login(MemberBean member, HttpSession session, Model model) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			MemberBean memberBean = new MemberBean();
			
			System.out.println(member.getMEM_ID());
			System.out.println(member.getMEM_PWD());
			
			map = memberService.selectMemberId(member);

			System.out.println("Session 유저: "+ member.getMEM_ID());
			
			//1. 등록된 아이디가 아닐 경우
			if (map == null) {
				//1-1. 로그인 실패
				System.out.println("로그인 실패!");
				return "/member/loginForm";
			//2. 등록된 아이디일 경우	
			}
			 else {
				memberBean = MapToBean.mapToMember(map); // 검색된 회원
				
				//2-1. 입력한 비밀번호가 일치하는 경우
				if (member.getMEM_PWD().equals(memberBean.getMEM_PWD())) {
					// 로그인 성공

					//2-1-1. 회원탈퇴 여부
					if (memberBean.getMEM_DEL().equals(0)) {
						return "/member/loginForm";
					} 
					else if(member.getMEM_ID().equals("admin")) {
						return "redirect:/adminMemberList.da";
					}

					System.out.println("로그인 성공!");
					// 세션 등록
					session.setAttribute("MEM_ID", memberBean.getMEM_ID());
					
				//2-2. 입력한 비밀번호가 일치하지 않는 경우
				} else {
					return "/member/loginForm";
				}
			}
			
			return "redirect:/home.da";
		}
	
	@RequestMapping(value = "/logout.da")
	public String logout(HttpServletRequest request, Model model) throws Exception {
		request.getSession().invalidate();
		return "redirect:/loginForm.da";
	}
	
//	@RequestMapping(value = "/member/loginForm.da")
//	public String loginForm(Model model) throws Exception {
//		/* memberService.selectKakaoId(null); */
//		return "/member/loginForm";
//	}

	// ajax 이용해서 카카오 아이디 비교해 MEM_ID가 있으면 로그인 성공, ajax이용해 data받을 시 값은 map을 이용해 받아야 한다
	@RequestMapping(value = "/getKakaoId.da", method = { RequestMethod.POST })
	public void getKakaoId(@RequestParam Map<String, Object> param, HttpSession session, HttpServletResponse response)
			throws Exception {

		// ajax에서 데이터 꺼냄
		String id = (String) param.get("id");

		System.out.println(id);

		// selectKakaoId 실행
		Map<String, Object> map = memberService.selectKakaoId(id);

		String idCheck = (String) map.get("MEM_ID");

		System.out.println(idCheck != null);

		// ajax 결과가 MEMBER 테이블에 있다면 로그인 성공
		if (idCheck != null) {
			System.out.println("로그인 성공");

			session.setAttribute("MEM_ID", id);

			// 로그인 성공 시 JSONObject에 데이터 값 넣어서 넘김
			JSONObject jsonVar = new JSONObject();
			jsonVar.put("check", "CHECK");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonVar.toString());

		} else {
			System.out.println("로그인 실패");

		}

	}

//	@RequestMapping(value = "/main.da")
//	public String mainPage(Model model) throws Exception {
//		/* memberService.selectKakaoId(null); */
//		return "/member/main";
//	}
//
//	@RequestMapping(value = "/fail.da")
//	public String mainPage2(Model model) throws Exception {
//		/* memberService.selectKakaoId(null); */
//		return "/member/fail";
//	}
	
	// 회원 아이디찾기
	@RequestMapping(value = "/findId.da")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findId");
		return mv;
	}

	@RequestMapping(value = "/findIdResult.da", method = RequestMethod.POST)
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findIdResult");
		List<Map<String, Object>> list = memberService.findId(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value = "/findIdPhone.da")
	public ModelAndView findIdPhone(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findIdPhone");
		return mv;
	}
	
	@RequestMapping(value = "/findIdPhoneResult.da", method = RequestMethod.POST)
	public ModelAndView findIdPhoneResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findIdPhoneResult");
		List<Map<String, Object>> list = memberService.findIdPhone(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	// 회원 비밀번호 찾기
	@RequestMapping(value = "/findPw.da")
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findPw");
		return mv;
	}

	@RequestMapping(value = "/findPwResult.da", method = RequestMethod.POST)
	public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/findPwResult");
		List<Map<String, Object>> list = memberService.findPw(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	

	@RequestMapping(value = "/myPage.da")
	public ModelAndView detailMember(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/member/detailMember");

		// String id = (String)session.getAttribute("MEM_ID");
		// Map<String,Object> map = mypageService.detailMember(commandMap.getMap());

		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
		Map<String, Object> map = mypageService.detailMember(commandMap.getMap());

		mv.addObject("map", map);

		return mv;

	}

	@RequestMapping(value = "/updateForm.da")
	public ModelAndView updateForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/member/updateMember");

		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));

		Map<String, Object> map = mypageService.detailMember(commandMap.getMap());

		mv.addObject("map", map);

		return mv;

	}

	@RequestMapping(value = "/update.da", method = { RequestMethod.POST })
	public ModelAndView updateSuccess(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/myPage.da");

		//commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));

		mypageService.updateMember(commandMap.getMap());

		// mypageService.updateMember(commandMap.getMap());
		mv.addObject("MEM_ID", commandMap.get("MEM_ID"));

		System.out.println("커맨드 값 : " + commandMap.get("MEM_ID"));

		return mv;
	}
	
	@RequestMapping(value = "/deleteMember.da")
	public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest req)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/home.da");
		mypageService.deleteMember(commandMap.getMap());
		req.getSession().invalidate();
		return mv;
	}
	
	// 일반회원 > 마이페이지 > 주문내역
		@RequestMapping(value = "/orderhistory.da")
		public String orderHistory(MemberBean memberBean, HttpSession session, Model model) throws Exception {

			Date date = new Date(); // 데이터 객체 생성
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 데이터 포맷 객체 생성
			List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>(); // 리스트 객체 생성
			String loginId = String.valueOf(session.getAttribute("MEM_ID"));
			System.out.println("Login : " + loginId);
			// 로그인 체크
			if (loginId != "null") {
				memberBean.setMEM_ID(loginId);
			} else {
				return "redirect:/loginForm.da";
			}
			// 날짜 데이터가 null일 경우 기본 값 설정
			if (memberBean.getDATE_START() == null || memberBean.getDATE_END() == null) {
				memberBean.setDATE_END(simpleDateFormat.format(date)); // 마지막 날짜를 현재의 날짜로 설정
				date.setMonth(-3); // 현재 날짜에서 3개월 전 날짜로 변경
				memberBean.setDATE_START(simpleDateFormat.format(date)); // 시작 날짜를 현재로부터 3개월 전의 날짜 설정
			}

			orderList = mypageService.orderHistory(memberBean); // order 주문 리스트를 불러온다
			
			model.addAttribute("start", memberBean.getDATE_START()); // model에 시작 날짜의 값을 전달
			model.addAttribute("end", memberBean.getDATE_END()); // model에 마지막 날짜의 값을 전달
			model.addAttribute("orderList", orderList); // model에 주문 리스트 값을 전달
			
			return "/member/orderHistory";
		}
		
		// 일반회원 > 마이페이지 > 주문내역 > 상태변경
		@RequestMapping(value = "/orderState.da")
		public String orderState(OrderBean orderBean, Model model) throws Exception {
			
			mypageService.orderState(orderBean); // ORDER_STATE 배송 상태 업데이트
			
			return "redirect:/orderhistory.da";
		}
		
		// 일반회원 > 마이페이지 > 주문내역 > 반품/취소
		@RequestMapping(value = "/orderReturn.da")
		public String orderReturn(@RequestParam(value="orderid", required=false) String orderId, Model model) throws Exception {
			System.out.println("ORDER_ID : " + orderId);
			return "/member/orderReturn";
		}
		
		// 일반회원 > 마이페이지 > 리뷰보기
		@RequestMapping(value = "/myReview.da")
		public String myReview(Model model, HttpSession session) throws Exception {
			
			OrderBean orderBean = new OrderBean(); // OrderBean 객체 생성
			List<Map<String,Object>> myReviewList = new ArrayList<Map<String,Object>>(); // 리스트 객체 생성
			
			orderBean.setORDER_ID(String.valueOf(session.getAttribute("MEM_ID"))); // 로그인 세션 아이디 값
			
			myReviewList = mypageService.myReview(orderBean); // 내 리뷰 리스트 불러오기
			
			model.addAttribute("myReview", myReviewList);
			
			return "/member/myReview";
		}
		
		// 일반회원 > 마이페이지 > 찜목록
		@RequestMapping(value = "/myPutLike.da")
		public String myPutLike(HttpSession session, Model model) throws Exception {

			LikeBean likeBean = new LikeBean(); // likeBean 객체 생성
			List<Map<String,Object>> myPutLikeList = new ArrayList<Map<String,Object>>(); // 리스트 객체 생성
			
			likeBean.setUP_MEM(String.valueOf(session.getAttribute("MEM_ID"))); // 로그인 세션 아이디 값
			
			myPutLikeList = mypageService.myPutLike(likeBean); // 내 리뷰 리스트 불러오기
			
			model.addAttribute("myPutLike", myPutLikeList);
			
			return "/member/myPutLike";
		}
		
		// 일반회원 > 마이페이지 > 찜목록 > 삭제
		@RequestMapping(value = "/myDeleteLike.da") 
		  public String deleteLikeL(LikeBean likeBean, HttpSession session, ProductBean product) 
				  throws Exception {
		    session.setAttribute("ITEM_ID", likeBean.getUP_ID());
		 		
			likeService.deleteLike(likeBean, session);
		    
			return "redirect:/myPutLike.da";
		}

}