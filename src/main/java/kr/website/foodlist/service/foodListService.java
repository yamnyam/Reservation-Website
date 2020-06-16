package kr.website.foodlist.service;

import java.util.List;

import kr.website.foodlist.vo.foodListVO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;

public interface foodListService {
	
	// 내 주변 밥집 호출
	public List<foodListVO> foodView(foodListVO vo) throws Exception;
	
	// 상세보기
	public foodListVO foodDetail(int no) throws Exception;
	
	public List<InformationVO> menu(int no) throws Exception;
	
	public ReserveVO resCheck(int no) throws Exception; 
	
}
