package kr.website.notice.dao;

import java.util.List;

import kr.website.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	// 공지사항 작성
	public void write(NoticeVO vo) throws Exception;
	
	// 공지사항 조회수 증가
	public void updateHits(int notice_no) throws Exception;
	
	// 공지사항 상세보기
	public NoticeVO view(int no) throws Exception;
	
	// 공지사항 리스트
	public List<NoticeVO> list(NoticeVO vo) throws Exception;
}
