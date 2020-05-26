package kr.website.notice.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.website.notice.service.NoticeService;
import kr.website.notice.vo.NoticeVO;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	private static final Logger Logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	// 공지사항 화면 호출
	@RequestMapping(value = "noticeWrite")
	public String write() throws Exception {
		Logger.info("Notice-writeView");
		return "/notice/noticeWrite";
	}
	
	// 공지사항 작성
	@RequestMapping(value = "write", method=RequestMethod.POST)
	public String write(Model model, NoticeVO vo) throws Exception {
		Logger.info("Notice-write");
		
		service.write(vo);
		
		return "main";
	}
	
	// 공지사항 조회
	@RequestMapping(value = "/noticeView", method=RequestMethod.POST)
	public String view(@RequestParam("notice_no") int no, Model model, HttpSession session) throws Exception {
		
		NoticeVO vo = service.view(no);
		
		service.updateHits(no, session);
		
		model.addAttribute("view", vo);
		
		return "/notice/noticeView";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void list(Model model, NoticeVO vo) throws Exception{
		
		List<NoticeVO> list = null;
		list = service.list(vo);
		
		model.addAttribute("list", list);
	}
}
