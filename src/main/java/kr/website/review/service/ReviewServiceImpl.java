package kr.website.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.review.dao.ReviewDAO;
import kr.website.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Inject
	private ReviewDAO dao;
	
	@Override
	public void read(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<String> check(ReviewVO vo) throws Exception {
		return dao.check(vo);
	}
	
	@Override
	public int count(ReviewVO vo) throws Exception {
		return dao.count(vo);
	}
	
}
