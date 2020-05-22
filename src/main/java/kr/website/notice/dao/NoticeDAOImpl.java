package kr.website.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public void write(NoticeVO vo) throws Exception {
		sql.insert("notice.write", vo); 
	}
	
	@Override
	public void updateHits(int notice_no) throws Exception {
		sql.update("notice.updateHits", notice_no);
	}
	
	@Override
	public NoticeVO view(int no) throws Exception{
		return sql.selectOne("notice.view", no);
	}
	
	@Override
	public List<NoticeVO> list(NoticeVO vo) throws Exception{
		return sql.selectList("notice.list", vo);
	}
}
