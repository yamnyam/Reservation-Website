package kr.website.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.website.review.vo.ReviewVO;

public class ReviewDAOImpl implements ReviewDAO {
	
	// MY-BATIS
	@Inject
	private SqlSession sql;
	
	@Override
	public void read(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<String> check(ReviewVO vo) throws Exception {
		return sql.selectList("review.noList", vo);
	}
	
	@Override
	public int count(ReviewVO vo) throws Exception {
		return sql.selectOne("review.count", vo);
	}
}
