package kr.website.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.website.service.LetterService;
import kr.website.vo.LetterVO;

@Controller
@RequestMapping("/board")
public class LetterController {
	private static final Logger logger = LoggerFactory.getLogger(LetterController.class);
	
	@Inject
	private LetterService bs;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception{
		logger.info("글 등록 GET 요청입니다");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(LetterVO board, Model model) {
		logger.info("글 등록 POST 요청입니다");
		logger.info(board.toString());
		String result = "success";
		try {
			bs.regist(board);
		} catch(Exception e){
			e.printStackTrace();
			result = "fail";
			model.addAttribute("errorMsg", e.getMessage());
		}
		
		model.addAttribute("result", result);
		
		return "/board/afterPost";
	}
}
