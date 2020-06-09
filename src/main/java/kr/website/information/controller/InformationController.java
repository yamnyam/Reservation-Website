package kr.website.information.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.website.foodlist.vo.foodListVO;

@Controller
@RequestMapping(value = "/information/*")
public class InformationController {
	private static final Logger Logger =  LoggerFactory.getLogger(InformationController.class);
	
//	@Inject
//	InformationService service;
	
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public String edit() throws Exception {
		
		return "/information/edit";
	}
}
