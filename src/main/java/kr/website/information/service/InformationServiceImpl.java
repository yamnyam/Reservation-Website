package kr.website.information.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.information.dao.InformationDAO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;

@Service
public class InformationServiceImpl implements InformationService {
	
	@Inject
	private InformationDAO dao;
	
	@Override
	public void stoInfo(InformationVO vo) throws Exception {
		dao.stoInfo(vo);
	}
	
	@Override
	public void menuInfo(InformationVO vo) throws Exception {
		dao.menuInfo(vo);
	}
	
	@Override
	public int stoNo(int no) throws Exception {
		return dao.stoNo(no);
	}
	
	@Override
	public InformationVO selectStore(int no) throws Exception{
		return dao.selectStore(no);
	}
	
	@Override
	public void averagePrice(int no) throws Exception{
		dao.averagePrice(no);
	}
	
	@Override
	public List<ReserveVO> resInfo(int no) throws Exception {
		return dao.resInfo(no);
	}
	
	@Override
	public List<ReserveVO> resManage (int no) throws Exception {
		return dao.resManage(no);
	}
	
	@Override
	public void resCancel(ReserveVO vo) throws Exception{
		dao.resCancel(vo);
	}
	
	public void resCheck (ReserveVO vo) throws Exception {
		dao.resCheck(vo);
	}
}
