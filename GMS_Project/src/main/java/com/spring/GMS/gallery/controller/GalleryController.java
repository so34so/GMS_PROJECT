package com.spring.GMS.gallery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.admin.service.AdminService;
import com.spring.GMS.dto.AdminDto;

@Controller
@RequestMapping("gallery")
public class GalleryController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="In" , method=RequestMethod.GET)
	public ModelAndView In(@RequestParam("artImage") String artImage) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gallery");
		
		List<AdminDto> artList = adminService.listCategory();
		AdminDto category = adminService.selectshowName(artImage);
		
		mv.addObject("artList" , artList);
		mv.addObject("category" , category);
		
		return mv;
	}
	
}
