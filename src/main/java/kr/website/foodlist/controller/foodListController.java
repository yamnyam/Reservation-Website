package kr.website.foodlist.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.website.foodlist.service.foodListService;
import kr.website.foodlist.vo.foodListVO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

@Controller
@RequestMapping(value = "/foodlist/*")
@SuppressWarnings("unchecked")
public class foodListController {
	
	private static final Logger Logger =  LoggerFactory.getLogger(foodListController.class);
	
	@Inject
	foodListService service;

	// 내 주변 밥집 화면 호출
	@RequestMapping(value = "/foodView", method=RequestMethod.POST)
	public String foodView(Model model, foodListVO vo) throws Exception {
		Logger.info("foodView");
		
		List<foodListVO> view = null;
		view = service.foodView(vo);
		
		model.addAttribute("view", view);
		model.addAttribute("gps_x", vo.getGps_x());
		model.addAttribute("gps_y", vo.getGps_y());
		
		return "/foodlist/foodView"; 
	}
//	
//	@RequestMapping(value = "/foodAround", method=RequestMethod.POST)
//	@ResponseBody
//	public String foodAround(Model model, foodListVO vo) throws Exception {
//		Logger.info("foodView");
//
//		List<foodListVO> view = null;
//		view = service.foodAround(vo);
//		
//	    JSONObject params = new JSONObject();
//	    params.put("view", view);
//	    
//	    JSONArray array = new JSONArray();
//	    array.add("리스트.");
//	    array.add("/foodlist/foodView");
//	    array.add(params);
//	    
//		return array.toJSONString(); 
//	}
	
	@RequestMapping(value = "/foodDetail", method=RequestMethod.POST)
	public String foodDetail(Model model, foodListVO vo, HttpSession session) throws Exception {
		
		int no = vo.getSto_no();
		
		foodListVO detail = service.foodDetail(no);
		
		List <InformationVO> menu = null;
		menu = service.menu(no);
		
		ReserveVO res = null;
		try {
			res = service.resCheck(vo.getSto_no());
			if(res.getTb_maxTable()==res.getTb_curTable())
				model.addAttribute("res", "1");
			model.addAttribute("res", "2");
		} catch (Exception e) {
		}
		
		model.addAttribute("detail", detail);
		model.addAttribute("menu", menu);
		session.setAttribute("cur_store_no", no);
		
		return "/foodlist/foodDetail";
	}
	
	@RequestMapping(value = "/reserve")
	public String foodReserve(Model model, foodListVO vo) throws Exception {
		
		int no = vo.getSto_no();
		
		foodListVO reserve = service.foodDetail(no);
		
		model.addAttribute("reserve", reserve);
		
		return "/foodlist/reserve";
	}
}
