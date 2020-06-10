package kr.website.information.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.information.dao.InformationDAO;
import kr.website.information.vo.InformationVO;

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
	public int stoNo(InformationVO vo) throws Exception {
		return dao.stoNo(vo);
	}
	
	@Override
	public InformationVO selectStore(int no) throws Exception{
		return dao.selectStore(no);
	}
	
	@Override
	public void averagePrice(int no) throws Exception{
		dao.averagePrice(no);
	}
}
