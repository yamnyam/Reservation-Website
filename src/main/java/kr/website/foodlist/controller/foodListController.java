package kr.website.foodlist.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.website.foodlist.service.foodListService;
import kr.website.foodlist.vo.foodListVO;
import kr.website.member.controller.MemberController;


@Controller
@RequestMapping(value = "/foodlist/*")
public class foodListController {
	
	private static final Logger Logger =  LoggerFactory.getLogger(foodListController.class);
	
	@Inject
	foodListService service;

	// 내 주변 밥집 화면 호출
	@RequestMapping(value = "foodView")
	public String Login() throws Exception{
		Logger.info("foodView");
		
//		List<foodListVO> view = null;
//		view = service.foodView(vo);
//		
//		model.addAttribute("view", view);
		
		return "/foodlist/foodView"; 
	}
}
