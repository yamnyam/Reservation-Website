package kr.website.notice.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.website.notice.dao.NoticeDAO;
import kr.website.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	@Override
	public void write(NoticeVO vo) throws Exception {
		dao.write(vo);
	}
	
	@Override
	public void updateHits(int notice_no, HttpSession session) throws Exception{
		long update_time = 0;
		
		if(session.getAttribute("update_time" + notice_no) != null) {
			update_time = (long)session.getAttribute("update_time" + notice_no);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.updateHits(notice_no);
			
			session.setAttribute("update_time" + notice_no, current_time);
		}
	}
	
	@Override
	public NoticeVO view(int no) throws Exception {
		
		return dao.view(no);
	}
	
	@Override
	public List<NoticeVO> list(NoticeVO vo) throws Exception{
		return dao.list(vo);
	}
}
