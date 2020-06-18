package kr.website.review.dao;


import java.util.List;

import kr.website.review.vo.ReviewVO;


public interface ReviewDAO {
	public void read(ReviewVO vo) throws Exception;
	
	public List<String> check(ReviewVO vo) throws Exception;
	
	public int count(ReviewVO vo) throws Exception;
	
	public void enroll(ReviewVO vo) throws Exception;
}
