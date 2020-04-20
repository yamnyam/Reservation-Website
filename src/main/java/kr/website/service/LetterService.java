package kr.website.service;

import java.util.List;

import kr.website.vo.LetterVO;

public interface LetterService {
	public void regist(LetterVO vo) throws Exception;
	//글 등록
	public LetterVO read(int bno) throws Exception;
	//글 읽기
	public void modify(LetterVO vo) throws Exception;
	//글 수정
	public void remove(int bno) throws Exception;
	//글삭제
	public List<LetterVO> listAll() throws Exception;
	//리스트 보기
}
