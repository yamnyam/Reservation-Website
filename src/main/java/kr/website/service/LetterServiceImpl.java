package kr.website.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.dao.LetterDAO;
import kr.website.vo.LetterVO;

@Service
public class LetterServiceImpl implements LetterService {
	
	@Inject
	private LetterDAO dao;
	
	@Override
	public void regist(LetterVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Override
	public LetterVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	@Override
	public void modify(LetterVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}
	
	@Override
	public List<LetterVO> listAll() throws Exception {
		return dao.listAll();
	}
}
