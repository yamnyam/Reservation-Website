package kr.website.letter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.letter.vo.LetterVO;

@Repository
public class LetterDAOImpl implements LetterDAO {
	
	@Inject
	private SqlSession sql;

	@Override
	public void write(LetterVO vo) throws Exception {
		sql.insert("letter.write", vo); 
	}

	@Override
	public LetterVO view(int no) throws Exception {
		return sql.selectOne("letter.view", no);
	}

	@Override
	public void modify(LetterVO vo) throws Exception {
		sql.update("letter.update", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		sql.delete("letter.delete", no);
	}
	
	@Override
	public int count(LetterVO vo) throws Exception{
		return sql.selectOne("letter.count", vo);
	}
	
	@Override
	public List<LetterVO> list(LetterVO vo) throws Exception {
		return sql.selectList("letter.list", vo);
	}
	
	@Override
	public void updateViewCnt(int let_no) throws Exception {
		sql.update("letter.updateViewCnt", let_no);
	}
}
