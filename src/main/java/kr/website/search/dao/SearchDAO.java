package kr.website.search.dao;

import java.util.List;

import kr.website.foodlist.vo.foodListVO;

public interface SearchDAO {
	
	// 검색 후 리스트
	public List<foodListVO> list(String search) throws Exception;
	
}
