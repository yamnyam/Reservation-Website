package kr.website.search.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.website.foodlist.vo.foodListVO;
import kr.website.search.service.SearchService;

@Controller
@RequestMapping("/search/*")
@SuppressWarnings("unchecked")
public class SearchController {
	
	private static final Logger Logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService service;
	
	// 검색 리스트 화면 호출
	@RequestMapping(value="searchList", method=RequestMethod.POST)
	public String  write(@RequestParam("search") String search, Model model) throws Exception {
		Logger.info("search");
		
		if(search == "" || search == null) return "/search/searchList";
		List<foodListVO> list = service.list(search);
		
		if(list.isEmpty()) return "/search/searchList";
		String x = list.get(0).getSto_gps_x();
		String y = list.get(0).getSto_gps_y();
		
		model.addAttribute("list", list);
		model.addAttribute("searchGps_x", x);
		model.addAttribute("searchGps_y", y);
//		model.addAttribute("gps_x", vo.getGps_x());
//		model.addAttribute("gps_y", vo.getGps_y());
		
		return "/search/searchList";
	}
}
