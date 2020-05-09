package kr.website.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.vo.LetterVO;


@Repository
public class LetterDAOImpl implements LetterDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "kr.website.mapper.letterMapper";
	
	@Override
	public void write(LetterVO vo) throws Exception {
		sql.insert(namespace + ".write", vo); 
	}

	@Override
	public LetterVO view(int no) throws Exception {
		return sql.selectOne(namespace + ".view", no);
	}

	@Override
	public void modify(LetterVO vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		sql.delete(namespace + ".delete", no);
	}

	@Override
	public List<LetterVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public int count() throws Exception{
		return sql.selectOne(namespace + ".count");
	}
	
	@Override
	public List<LetterVO> listPage(int displayPost, int postNum) throws Exception {
		
		 HashMap data = new HashMap();
		  
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}
	
	@Override
	public void updateViewCnt(int let_no) throws Exception {
		sql.update(namespace + ".updateViewCnt", let_no);
	}
}
