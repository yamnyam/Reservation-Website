package kr.website.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.website.notice.service.NoticeService;
import kr.website.notice.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private NoticeService service;

	@RequestMapping(value = "/")
	public String home(Locale locale, Model model, NoticeVO vo) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<NoticeVO> list = null;
		list = service.list(vo);
		
		model.addAttribute("list", list);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
}
