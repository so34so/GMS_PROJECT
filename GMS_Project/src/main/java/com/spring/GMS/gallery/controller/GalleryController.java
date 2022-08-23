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
	public ModelAndView In(@RequestParam("artTitle") String artTitle) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gallery");
		
		List<AdminDto> photoList = adminService.listStatus("사진");
		List<AdminDto> paintList = adminService.listStatus("그림");
		List<AdminDto> artList = adminService.listCategory();
		AdminDto category = adminService.selectartTitle(artTitle);
		
		mv.addObject("photoList" , photoList);
		mv.addObject("paintList" , paintList);
		mv.addObject("artList" , artList);
		mv.addObject("category" , category);
		
		return mv;
	}
	
	@RequestMapping(value="All" , method=RequestMethod.GET)
	public ModelAndView All() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allGallery");
		
		List<AdminDto> photoList = adminService.listStatus("사진");
		List<AdminDto> paintList = adminService.listStatus("그림");
		List<AdminDto> artList = adminService.listCategory();
		
		mv.addObject("photoList" , photoList);
		mv.addObject("paintList" , paintList);
		mv.addObject("artList" , artList);
		
		return mv;
	}
	
}
