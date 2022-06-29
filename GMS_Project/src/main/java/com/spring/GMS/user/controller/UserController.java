package com.spring.GMS.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/update");
		
		mv.addObject("memberDto" ,   userService.showOneMember((String)session.getAttribute("loginUser")));
		
		return mv;
	}
	
	@RequestMapping(value="/update" , method=RequestMethod.POST)
	public ResponseEntity<Object> update(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		String htmlBody ="";
		if(userService.modifyUser(memberDto)) {
			
			htmlBody += "<script>";
			htmlBody += "alert('정보가 수정되었습니다.');";
			htmlBody += "location.href='" + request.getContextPath() + "/member/index';";
			htmlBody += "</script>";
		}
		else {
			htmlBody += "<script>";
			htmlBody += "alert('비밀번호를 확인하세요.');";
			htmlBody += "history.go(-1);";
			htmlBody += "</script>";
		}
		
		return new ResponseEntity<Object> (htmlBody, responseHeaders , HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/delete" , method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/delete");
		
		mv.addObject("memberDto" , userService.showOneMember((String)session.getAttribute("loginUser")));
		
		return mv;
	}
	
	@RequestMapping(value="/delete" , method=RequestMethod.POST)
	public ResponseEntity<Object> delete(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		String htmlBody ="";
		if(userService.deleteUser(memberDto)) {
			HttpSession session = request.getSession();
			session.invalidate();
			htmlBody += "<script>";
			htmlBody += "alert('탈퇴 완료되었습니다.');";
			htmlBody += "location.href='" + request.getContextPath() + "/member/index';";
			htmlBody += "</script>";
		}
		else {
			htmlBody += "<script>";
			htmlBody += "alert('비밀번호를 확인하세요.');";
			htmlBody += "history.go(-1);";
			htmlBody += "</script>";
		}
		
		return new ResponseEntity<Object> (htmlBody, responseHeaders , HttpStatus.OK);
		
	}
	@RequestMapping(value="/pwupdate" , method=RequestMethod.GET)
	public ModelAndView pwupdate(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/pwupdate");
		
		mv.addObject("memberDto" , userService.showOneMember((String)session.getAttribute("loginUser")));
		
		return mv;
	}
}
