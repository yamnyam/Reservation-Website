package kr.website.information.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.json.simple.JSONArray;
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
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setSto_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setSto_thumbPhoto(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.stoInfo(vo);
		
		int sto_no = service.stoNo(vo.getSto_no_acc());
		
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
		
		service.averagePrice(sto_no);
		
		return "redirect:/";
	}
	
	
}
