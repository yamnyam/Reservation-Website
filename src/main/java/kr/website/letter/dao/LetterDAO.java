package kr.website.letter.dao;

import java.util.List;

import kr.website.letter.vo.LetterVO;

public interface LetterDAO {
	
	// 게시물 작성
	public void write(LetterVO vo) throws Exception;
	
	// 게시물 조회
	public LetterVO view(int no) throws Exception;
	
	// 게시물 수정
	public void modify(LetterVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int no) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<LetterVO> list(int displayPost, int postNum) throws Exception;
	
	// 게시물 조회수 증가
	public void updateViewCnt(int let_no) throws Exception;
}
