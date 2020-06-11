package kr.website.information.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;

@Repository
public class InformationDAOImpl implements InformationDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public void stoInfo(InformationVO vo) throws Exception {
		sql.insert("information.stoInfo", vo);
	}
	
	@Override
	public void menuInfo(InformationVO vo) throws Exception {
		sql.insert("information.menuInfo", vo);
	}
	
	@Override
	public int stoNo(int no) throws Exception {
		return sql.selectOne("information.stoNo", no);
	}
	
	@Override
	public InformationVO selectStore(int no) throws Exception {
		return sql.selectOne("information.selectStore", no);
	}
	
	@Override
	public void averagePrice(int no) throws Exception {
		sql.update("information.averagePrice", no);
	}
	
	@Override
	public List<ReserveVO> resInfo (int no) throws Exception {
		return sql.selectList("information.resInfo", no);
	}
	
	@Override
	public List<ReserveVO> resManage (int no) throws Exception {
		return sql.selectList("information.resManage", no);
	}
}
