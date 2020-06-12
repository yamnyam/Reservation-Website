package kr.website.information.dao;

import java.util.List;

import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;

public interface InformationDAO {
	
	public void stoInfo(InformationVO vo) throws Exception;
	
	public void menuInfo(InformationVO vo) throws Exception;
	
	public int stoNo(int no) throws Exception;
	
	public InformationVO selectStore(int no) throws Exception;
	
	public void averagePrice(int no) throws Exception;
	
	public List<ReserveVO> resInfo (int no) throws Exception;
	
	public List<ReserveVO> resManage (int no) throws Exception;
	
	public void resCancel(ReserveVO vo) throws Exception;
	
	public void resCheck(ReserveVO vo) throws Exception;
}
