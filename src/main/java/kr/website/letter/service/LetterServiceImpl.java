package kr.website.letter.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.website.letter.dao.LetterDAO;
import kr.website.letter.vo.LetterVO;

@Service
public class LetterServiceImpl implements LetterService {
	
	@Inject
	private LetterDAO dao;
	
	@Override
	public void write(LetterVO vo) throws Exception {
		dao.write(vo);
	}
	
	@Override
	public LetterVO view(int no) throws Exception {
		return dao.view(no);
	}
	
	@Override
	public void modify(LetterVO vo) throws Exception {
		dao.modify(vo);
	}
	
	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);
	}
	
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	@Override
	public List<LetterVO> list(int displayPost, int postNum) throws Exception {
	 return dao.list(displayPost, postNum);
	}
	
	@Override
	public void updateViewCnt(int let_no, HttpSession session) throws Exception {
		long update_time = 0;
		
		if(session.getAttribute("update_time" + let_no) != null) {
			update_time = (long)session.getAttribute("update_time" + let_no);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.updateViewCnt(let_no);
			
			session.setAttribute("update_time" + let_no, current_time);
		}
	}
}
