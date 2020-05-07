package kr.website.dao;

import javax.servlet.http.HttpSession;

import kr.website.vo.MemberVO;

public interface MemberDAO {
	
	// 회원 가입
	public void register(MemberVO vo) throws Exception;
	
	// 회원 로그인 체크
	public boolean loginCheck(MemberVO vo) throws Exception ;
	
	// 회원 로그인 정보
	public MemberVO getMemberInfo(MemberVO vo) throws Exception;
	
	// 회원 로그아웃
	public void logout(HttpSession session) throws Exception;
}
