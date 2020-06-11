package kr.website.reserve.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.website.reserve.service.ReserveService;
import kr.website.reserve.vo.ReserveVO;

@Controller
@RequestMapping(value = "/store/*")
public class ReserveController {
	
	@Inject
	ReserveService service;
	
	@RequestMapping(value = "/afterReserve", method=RequestMethod.POST)
	public String afterReserve(ReserveVO vo, HttpSession session) throws Exception {
		
		int no = (int) session.getAttribute("acc_no");
		
		vo.setRes_no_acc(no);
		
		service.reserve(vo);
		
		return "redirect:/";
	}
}
