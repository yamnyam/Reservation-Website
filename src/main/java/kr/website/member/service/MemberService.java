package kr.website.member.service;

import javax.servlet.http.HttpSession;

import kr.website.member.vo.MemberVO;

public interface MemberService {
	
	//회원 가입
	public void register(MemberVO vo) throws Exception;
	
	//회원 가입 중복 로그인 체크
	public int idCheck(MemberVO vo) throws Exception;
	
	// 회원 로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception;
	
	// 회원 로그아웃
	public void logout(HttpSession session) throws Exception;
}
