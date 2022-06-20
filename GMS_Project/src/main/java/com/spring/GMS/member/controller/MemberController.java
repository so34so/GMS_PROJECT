package com.spring.GMS.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/index" , method=RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("member/login");
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("member/register");
	}
	
	
	
}
