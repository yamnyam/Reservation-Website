package kr.website.review.service;

import java.util.List;

import kr.website.hashtag.vo.HashtagVO;
import kr.website.review.vo.ReviewVO;

public interface ReviewService {
	public void read(ReviewVO vo) throws Exception;
	
	public List<String> check(ReviewVO vo) throws Exception;
	
	public int count(ReviewVO vo) throws Exception;
	
	public void insertTag(HashtagVO vo) throws Exception;
}
