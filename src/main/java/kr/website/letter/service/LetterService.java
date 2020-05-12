package kr.website.letter.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.website.letter.vo.LetterVO;

public interface LetterService {
	
	// 게시글 작성
	public void write(LetterVO vo) throws Exception;
	
	// 게시글 조회
	public LetterVO view(int no) throws Exception;
	
	// 게시글 수정
	public void modify(LetterVO vo) throws Exception;
	
	// 게시글 삭제
	public void delete(int no) throws Exception;
	
	// 게시글 총 갯수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<LetterVO> list(LetterVO vo) throws Exception;
	
	// 게시물 조회수 증가
	public void updateViewCnt(int let_no, HttpSession session) throws Exception;
}
