package kr.website.review.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.website.review.service.ReviewService;
import kr.website.review.vo.ReviewVO;


@Controller
@RequestMapping(value = "/review/*")
@SuppressWarnings("unchecked")
public class ReviewController {
	
	@Inject
	ReviewService service;
	
	private static final Logger Logger =  LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/enroll", method=RequestMethod.POST)
	@ResponseBody
	public void revEnroll (ReviewVO vo, HttpSession session) throws Exception {
		
		int cur_sto_no = (int) session.getAttribute("cur_sto_no");
		int acc_no = (int) session.getAttribute("acc_no");
		vo.setReview_no_acc(acc_no);
		vo.setReview_no_sto(cur_sto_no);
		
		List<String> res_no = service.check(vo);
		
		int count = service.count(vo);
		
		
		JSONArray array = new JSONArray();
		
		
	}
}
