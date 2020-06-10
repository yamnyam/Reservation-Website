package kr.website.information.dao;

import kr.website.information.vo.InformationVO;

public interface InformationDAO {
	
	public void stoInfo(InformationVO vo) throws Exception;
	
	public void menuInfo(InformationVO vo) throws Exception;
	
	public int stoNo(InformationVO vo) throws Exception;
	
	public InformationVO selectStore(int no) throws Exception;
}
