package kr.website.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "logincheck", method = RequestMethod.POST)
	public ModelAndView logincheck(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		boolean result = service.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result == true) { // 로그인 성공
			mav.addObject("url", "/");
			mav.addObject("msg", "정상적으로 로그인되었습니다.");
		} else { // 로그인 실패
			mav.addObject("url", "/member/login");
			mav.addObject("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}
		
		mav.setViewName("/common/msgAlert");
		return mav;
		
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpSession session) throws Exception {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
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
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String Register(MemberVO vo) throws Exception {
		Logger.info("get register");
		service.register(vo);
		return "main";
	}
}
