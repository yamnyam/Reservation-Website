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

import kr.website.hashtag.vo.HashtagVO;
import kr.website.review.service.ReviewService;
import kr.website.review.vo.ReviewVO;


@Controller
@RequestMapping(value = "/review/*")
@SuppressWarnings("unchecked")
public class ReviewController {
	
	private static final Logger Logger =  LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	ReviewService service;
	
	@RequestMapping(value = "/enroll", method=RequestMethod.POST)
	@ResponseBody
	public String revEnroll (ReviewVO vo, HttpSession session) throws Exception {
		
		int cur_sto_no = (int)session.getAttribute("cur_store_no");
		int acc_no = (int)session.getAttribute("acc_no");
		vo.setReview_no_acc(acc_no);
		vo.setReview_no_sto(cur_sto_no);
		List<String> res_no = service.check(vo);

		HashtagVO tag_vo = new HashtagVO();
		String[] hashtag = vo.getReview_tag().trim().split("#");
		
		int count = service.count(vo);
		try {
			if(count < res_no.size()) {
				vo.setReview_level_acc((int)session.getAttribute("acc_level"));

				service.enroll(vo);

				for(int i=1; i < hashtag.length; i++) {
					tag_vo.setTag_name(hashtag[i]);
					tag_vo.setTag_no_sto(cur_sto_no);
					service.insertTag(tag_vo);
				}
		
			}
				
		}catch(Exception e) {
			
		}
		
		JSONArray array = new JSONArray();
		
		return array.toJSONString();
	}
}
