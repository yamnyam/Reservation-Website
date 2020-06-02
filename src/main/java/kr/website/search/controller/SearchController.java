package kr.website.search.controller;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		List<foodListVO> list = service.list(search);
		
		String x = list.get(0).getSto_gps_x();
		String y = list.get(0).getSto_gps_y();
		
		model.addAttribute("list", list);
		model.addAttribute("searchGps_x", x);
		model.addAttribute("searchGps_y", y);
//		model.addAttribute("gps_x", vo.getGps_x());
//		model.addAttribute("gps_y", vo.getGps_y());
		
		return "/search/searchList";
	}
	
	@RequestMapping(value="/search2", method=RequestMethod.POST)
	@ResponseBody
	public String listup(foodListVO vo, Model model) throws Exception {
		Logger.info("search2");
		
		foodListVO vo2 = service.search2(vo);
		
	    JSONObject params = new JSONObject();
	    params.put("vo", vo2);
//	    params.put("searchGps_y", vo2.getSto_gps_y());
	    
	    JSONArray array = new JSONArray();
	    array.add("리스트.");
	    array.add("/search/searchList");
	    array.add(params);
	    
	    return array.toJSONString(); 
	}
	
}
