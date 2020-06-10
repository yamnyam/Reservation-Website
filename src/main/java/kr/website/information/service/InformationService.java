package kr.website.information.service;

import kr.website.information.vo.InformationVO;

public interface InformationService {
	
	public void stoInfo(InformationVO vo) throws Exception;
	
	public void menuInfo(InformationVO vo) throws Exception;
	
	public int stoNo(int no) throws Exception;
	
	public InformationVO selectStore(int no) throws Exception;
	
	public void averagePrice(int no) throws Exception;
}
