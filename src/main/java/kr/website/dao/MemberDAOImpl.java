package kr.website.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.website.vo.MemberVO;

@Service
public class MemberDAOImpl implements MemberDAO {

	// MY-BATIS
	@Inject
	private SqlSession sql;
	
	// Mapper
	private static String namespace = "kr.website.mappers.memberMapper";
	
	// 회원 가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
		
	}
	
	// 회원 가입 중복 로그인 체크
	@Override
	public int idCheck(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".idCheck", vo);
	}
	
	// 회원 로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo) throws Exception {
		String name = sql.selectOne(namespace + ".loginCheck", vo);
		return (name == null) ? false : true;
		
	}
	
	// 회원 로그인 정보
	@Override
	public MemberVO getMemberInfo(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".getMemberInfo", vo);
	}
	
	// 회원 로그인 Count
	@Override
	public void updateLogin(MemberVO vo) throws Exception{
		sql.update(namespace + ".loginUpdate", vo);
	}
	
	// 회원 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		
	}

}
