package kr.website.controller;

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

import kr.website.service.LetterService;
import kr.website.vo.LetterVO;

@Controller
@RequestMapping("/letter/*")
public class LetterController {
	
	private static final Logger Logger = LoggerFactory.getLogger(LetterController.class);
	
	@Inject
	private LetterService service;
	
	// 게시글 목록
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		
		Logger.info("Letter");
		
		List<LetterVO> list = null;
		
		list = service.list();
		
		model.addAttribute("list", list);
		
		return "/letter/list";
	}
	
	// 게시글 작성
	@RequestMapping(value = "write", method=RequestMethod.GET)
	public String write() throws Exception {
		
		Logger.info("write");
		
		return "/letter/write";
	}
	
	// 게시글 작성 후
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String postWrite(LetterVO vo) throws Exception {
		
		service.write(vo);
		
		return "redirect:/letter/listPage?num=1";
	}
	
	// 게시글 조회
	@RequestMapping(value = "/view")
	public String view(@RequestParam("let_no") int no, Model model, HttpSession session) throws Exception {
		
		LetterVO vo = service.view(no);
		
		service.updateViewCnt(no, session);
		
		model.addAttribute("view", vo);
		
		return "/letter/view";
	}
	
	// 게시글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("let_no") int no, Model model) throws Exception{
		
		LetterVO vo = service.view(no);
		
		model.addAttribute("view", vo);
		
		return "/letter/modify";

	}
	
	// 게시글 수정 후
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify (LetterVO vo) throws Exception {
		
		service.modify(vo);
		
		return "redirect:/letter/view?let_no=" + vo.getLet_no();
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("let_no") int no) throws Exception{
		
		service.delete(no);
		
		return "redirect:/letter/listPage?num=1";
	}
	
	// 게시글 총 갯수
	@RequestMapping(value = "/listpage")
	public void getListPage(Model model) throws Exception{
		
		List<LetterVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시글 목록 + 페이징
	@RequestMapping(value = "/listPage")
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		int count = service.count(); // 게시글 총 갯수
		int postNum = 10; // 한 페이지에 출력할 게시글 갯수
		int pageNum = (int)Math.ceil((double)count/postNum); // 하단 페이징 번호{(게시물 총 갯수 / 한 페이지에 출력할 갯수)의 올림}
		int displayPost = (num - 1) * postNum; // 출력할 게시글
		int pageNum_cnt = 10; // 한 번에 표시할 페이징 번호의 갯수
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt); // 표시되는 페이지 번호 중 마지막 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		List<LetterVO> list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);
	}
}
