package kr.website.member.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.website.member.dao.MemberDAO;
import kr.website.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	// 회원가입 중복 로그인 체크
	@Override
	public int idCheck(MemberVO vo) throws Exception {
		return dao.idCheck(vo);
	}
	
	// 회원 로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception {
		boolean result = dao.loginCheck(vo);
		
		// true일 경우 세션에 등록
		if (result) { 
			MemberVO member = dao.getMemberInfo(vo);
			// 로그인 할 시 acc_count 값  + 1, 날짜 업데이트
			dao.updateLogin(vo);
			dao.dateLogin(vo);
			
			//세션 변수 등록
			session.setAttribute("acc_no", member.getAcc_no());
			session.setAttribute("acc_id", member.getAcc_id());
			session.setAttribute("acc_name", member.getAcc_name());
		}
		
		return result;
	}
	
	@Override
	public void logout(HttpSession session) throws Exception {
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
}
