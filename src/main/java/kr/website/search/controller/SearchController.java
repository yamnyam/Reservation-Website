package kr.website.search.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.website.foodlist.vo.foodListVO;
import kr.website.search.service.SearchService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	private static final Logger Logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService service;
	
	// 검색 리스트 화면 호출
	@RequestMapping(value="searchList")
	public String  write(@RequestParam("search") String search, Model model) throws Exception {
		Logger.info("search");
		
		List<foodListVO> list = service.list(search);
		
		model.addAttribute("list", list);
		
		return "/search/searchList";
	}
	
}
