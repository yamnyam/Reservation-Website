package kr.website.information.service;

import java.util.List;

import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;

public interface InformationService {
	
	public void stoInfo(InformationVO vo) throws Exception;
	
	public void menuInfo(InformationVO vo) throws Exception;
	
	public int stoNo(int no) throws Exception;
	
	public InformationVO selectStore(int no) throws Exception;
	
	public void averagePrice(int no) throws Exception;
	
	public List<ReserveVO> resInfo (int no) throws Exception;
	
	public List<ReserveVO> resManage (int no) throws Exception;
}
