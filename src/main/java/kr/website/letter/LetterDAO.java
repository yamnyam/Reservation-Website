package kr.website.letter;

import java.util.List;

public interface LetterDAO {
	public void create(LetterVO vo) throws Exception;
	//글 작성하기
	public LetterVO read(int bno) throws Exception;
	//글 읽어오기
	public void update(LetterVO vo) throws Exception;
	//글 수정하기
	public void delete(int bno) throws Exception;
	//글 삭제하기
	public List<LetterVO> listAll() throws Exception;
	//글 목록 가져오기
}
