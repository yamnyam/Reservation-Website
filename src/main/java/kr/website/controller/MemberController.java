package kr.website.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.website.service.MemberService;
import kr.website.vo.MemberVO;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	private static final Logger Logger =  LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;

	// 로그인 화면 호출
	@RequestMapping(value = "login")
	public String Login() throws Exception{
		Logger.info("Login");
		return "/member/login"; 
	}
	
	// 로그인 처리
	@RequestMapping(value = "logincheck")
	public ModelAndView logincheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = service.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result == true) { // 로그인 성공
			// main.jsp 로 이동
			mav.setViewName("main");
			mav.addObject("msg", "success");
		} else { // 로그인 실패
			// login.jsp 로 이동
			mav.setViewName("member/login");
			mav.addObject("msg", "failure");
		}
		
		return mav;
		
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	// 회원가입 화면 호출
	@RequestMapping(value = "signup")
	public String getRegister() throws Exception {
		Logger.info("get register");
		return "/member/signup";
	}
	
	// 회원가입 등록
	@RequestMapping(value = {"register", "POST"})
	public String Register(MemberVO vo) throws Exception {
		Logger.info("get register");
		// 데이터베이스 저장
		service.register(vo);
		return "main";
	}
}
