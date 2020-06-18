package kr.website.foodlist.dao;

import java.util.List;

import kr.website.foodlist.vo.foodListVO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

public interface foodListDAO {
	
	// 내 주변 밥집 화면 호출
	public List<foodListVO> foodView(foodListVO vo) throws Exception;

	// 상세보기
	public foodListVO foodDetail(int no) throws Exception;
	
	public List<InformationVO> menu(int no) throws Exception;
	
	public ReserveVO resCheck(int no) throws Exception;
	
	public List<ReviewVO> review(int no) throws Exception;
	
	public List<String> tag(int no) throws Exception;
}
