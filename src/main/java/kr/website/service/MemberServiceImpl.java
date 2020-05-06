package kr.website.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.website.dao.MemberDAO;
import kr.website.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	// 회원 로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if(result) { // true일 경우 세션에 등록
			MemberVO vo2 = dao.viewMember(vo);
			//세션 변수 등록
			session.setAttribute("acc_id", vo2.getAcc_id());
			session.setAttribute("acc_name", vo2.getAcc_name());
		}
		return result;
	}
	
	@Override
	public void logout(HttpSession session) {
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
}
