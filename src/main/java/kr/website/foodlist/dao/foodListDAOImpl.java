package kr.website.foodlist.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.foodlist.vo.foodListVO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

@Repository
public class foodListDAOImpl implements foodListDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<foodListVO> foodView(foodListVO vo) throws Exception {
		return sql.selectList("foodlist.list", vo);
	}
	
	@Override
	public foodListVO foodDetail(int no) throws Exception {
		return sql.selectOne("foodlist.detail", no);
	}
	
	@Override
	public List<InformationVO> menu(int no) throws Exception {
		return sql.selectList("foodlist.menu", no);
	}

	@Override
	public ReserveVO resCheck(int no) throws Exception {
		return sql.selectOne("foodlist.resCheck", no);
	}
	
	@Override
	public List<ReviewVO> review(int no) throws Exception {
		return sql.selectList("foodlist.review", no);
	}
	
	@Override
	public List<String> tag(int no) throws Exception {
		return sql.selectList("foodlist.tag", no);
	}
	
	@Override
	public int congest(int no) throws Exception {
		return sql.selectOne("foodlist.congest", no);
	}
}
