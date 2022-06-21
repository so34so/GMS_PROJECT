package com.spring.GMS.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.dto.MemberDto;
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
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public @ResponseBody String register(MemberDto memberDto , HttpServletRequest request) {
		memberService.registerMember(memberDto);
		
		String htmlBody = "<script>";
			   htmlBody += "alert('회원가입 완료!');";
			   htmlBody += "location.href'" + request.getContextPath() + "/member/login';";
			   htmlBody += "</script>";
			   
		return htmlBody;
	}
	
	@RequestMapping(value="/userCheck" , method=RequestMethod.POST)
	public ResponseEntity<Object> userCheck(@RequestParam("id") String id){
		return new ResponseEntity<Object>(memberService.overlapped(id) , HttpStatus.OK);
	}
	
	@RequestMapping(value="/nameCheck" , method=RequestMethod.POST)
	public ResponseEntity<Object> nameCheck(@RequestParam("nickname") String nickname){
		return new ResponseEntity<Object>(memberService.nameCheck(nickname) , HttpStatus.OK);
	}
	
	@RequestMapping(value="/password" , method=RequestMethod.GET)
	public ModelAndView password() {
		return new ModelAndView("member/password");
	}
	
	
	
	
	
}
