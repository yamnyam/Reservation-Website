package kr.website.search.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.foodlist.vo.foodListVO;

@Repository
public class SearchDAOImpl implements SearchDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<foodListVO> list(String search) throws Exception {
		
		sql.insert("search.insert", search); 
		
		return sql.selectList("search.list", search);
	}

}
