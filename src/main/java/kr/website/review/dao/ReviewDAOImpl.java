package kr.website.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.website.hashtag.vo.HashtagVO;
import kr.website.review.vo.ReviewVO;

@Service
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

	@Override
	public void enroll(ReviewVO vo) throws Exception {
		sql.insert("review.enroll", vo);
	}	
	
	@Override
	public void insertTag(HashtagVO vo) throws Exception {
		sql.insert("review.insertTag", vo);
	}
}
