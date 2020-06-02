package kr.website.search.service;

import java.util.List;

import kr.website.foodlist.vo.foodListVO;

public interface SearchService {
	
	// 검색 후 리스트
	public List<foodListVO> list(String search) throws Exception;
	
	public foodListVO search2(foodListVO vo) throws Exception;
	
}
