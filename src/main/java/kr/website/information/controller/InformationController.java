package kr.website.information.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.website.information.service.InformationService;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/information/*")

public class InformationController {
	private static final Logger Logger =  LoggerFactory.getLogger(InformationController.class);
	
	@Inject
	InformationService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, InformationVO vo) throws Exception {
		
		InformationVO sto_vo = service.selectStore(vo.getSto_no_acc());
		
		model.addAttribute("store", sto_vo);
		
		return "/information/edit";
	}
	
	@RequestMapping(value = "/stoInfo", method=RequestMethod.POST)
	public String stoInfo(InformationVO vo, MultipartFile file) throws Exception {
		InformationVO vo1 = new InformationVO();
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		
		vo.setSto_photo(File.separator + "imgUpload" + File.separator + fileName);
		vo.setSto_thumbPhoto(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
		}
		service.stoInfo(vo);
		
		int sto_no = service.stoNo(vo.getSto_no_acc());
		try {	// 메뉴 없을경우 exception
			String[] menu_name = vo.getMenu_name().split(",");
			String[] menu_price = vo.getMenu_price().split(",");
			String[] menu_check = vo.getMenu_check().split(",");
			
			for(int i = 0; i < menu_name.length; i++) {
				vo1.setMenu_name(menu_name[i]);
				vo1.setMenu_price(menu_price[i]);
				vo1.setMenu_check(menu_check[i]);
				vo1.setMenu_no_sto(sto_no);
				service.menuInfo(vo1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		service.averagePrice(sto_no);
		
		return "redirect:/";
	}
//	@RequestMapping(value = "/sto")
//	public String stoInfo(InformationVO vo, MultipartFile file, HttpSession session) throws Exception {
//		System.out.println("hihihihi");
//		System.out.println(session.getServletContext().getRealPath("/"));
//		return "redirect:/";
//	}
	
	@RequestMapping(value = "/resInfo")
	public String resInfo(HttpSession session, Model model) throws Exception {
		
		int no = (int) session.getAttribute("acc_no");
		
		List<ReserveVO> list = null;
		
		list = service.resInfo(no);
		
		model.addAttribute("list",list);
		
		return "/information/resInfo";
	}
	
	@RequestMapping(value = "/resCancel")
	public String resCancel(HttpSession session, @RequestParam("res_no") int res_no) throws Exception{
		
		int no = (int) session.getAttribute("acc_no");
		
		ReserveVO vo = new ReserveVO();
		vo.setRes_no_acc(no);
		vo.setRes_no(res_no);
		
		service.resCancel(vo);
		
		return "redirect:/information/resInfo";
	}
	
	@RequestMapping(value = "/resManage")
	@ResponseBody
	public String resManage(HttpSession session, Model model) throws Exception {
		
		int acc_no = (int) session.getAttribute("acc_no");
		String sto_no = (String) session.getAttribute("sto_no");
		
		List<ReserveVO> vo = null;
		
		if(sto_no != null) {
			vo = service.resManage(session, acc_no);
		} else {
			
		}
		
		model.addAttribute("list",vo);
		
		return "/information/resManage";
	}
	
	@RequestMapping(value = "/resCheck")
	public String resCheck(HttpSession session, ReserveVO vo) throws Exception {
		
		int check_no = vo.getRes_check();
		int sto_no = (int) session.getAttribute("sto_no");
		vo.setRes_no_sto(sto_no);
		int max_Table = service.resCheck(vo);
		
		if (check_no == 1) {
			service.tbUpdate(vo);
		}
		
		return "redirect:/information/resManage";
	}
	
}
