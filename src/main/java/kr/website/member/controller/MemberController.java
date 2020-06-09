package kr.website.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.website.member.service.MemberService;
import kr.website.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member/*")
@SuppressWarnings("unchecked")
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
	@RequestMapping(value="logincheck", method=RequestMethod.POST)
	@ResponseBody
	public String logincheck(@ModelAttribute MemberVO vo, HttpSession session, Model model) throws Exception {
		boolean result = service.loginCheck(vo, session);
	    
		model.addAttribute("acc_name", vo.getAcc_name());
		JSONArray array = new JSONArray();
	    
	    // true: 로그인 성공 | false: 로그인  실패
	    if (result == true) {
	    	array.add("정상적으로 로그인되었습니다.");
	    	array.add("/");
	    } else {
	    	array.add("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	    	array.add("/member/login");	    	
	    }
	    
	    return array.toJSONString();
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "logout")
	@ResponseBody
	public String logout(HttpSession session) throws Exception {
		service.logout(session);
		
		JSONArray array = new JSONArray();
		array.add("정상적으로 로그아웃되었습니다.");
		array.add("/");
		
		return array.toJSONString();
	}
	
	// 회원가입 화면 호출
	@RequestMapping(value = "signup")
	public String getRegister() throws Exception {
		return "/member/signup";
	}
	
	// 회원가입 등록
	@RequestMapping(value="register", method=RequestMethod.POST)
	@ResponseBody
	public String Register(MemberVO vo) throws Exception {
		JSONArray array = new JSONArray();
	    int id_count = service.idCheck(vo);
	    
	    // 1: 중복아이디 존재
	    if (id_count == 1) {
	    	array.add("이미 등록된 아이디입니다.");
	    } else {
	    	service.register(vo);
	    	array.add("정상적으로 회원가입되었습니다.");
	    	array.add("/");	    	
	    }
	    return array.toJSONString();
	}
}
