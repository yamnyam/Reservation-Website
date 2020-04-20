package kr.website.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.vo.LetterVO;


@Repository
public class LetterDAOImpl implements LetterDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.website.mapper.LetterMapper";
	
	@Override
	public void create(LetterVO vo) throws Exception {
		session.insert(namespace + ".create", vo); 
	}

	@Override
	public LetterVO read(int bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(LetterVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<LetterVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
}
