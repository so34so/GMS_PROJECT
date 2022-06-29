package com.spring.GMS.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView index() throws Exception {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public ModelAndView login() throws Exception {
		return new ModelAndView("member/login");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public ResponseEntity<Object> login(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		String htmlBody = "";
		if(memberService.loginMember(memberDto) != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("isLogOn" , true);	
			session.setAttribute("loginUser", memberDto.getGalleryId());
			htmlBody += "<script>";
			htmlBody += "alert('로그인 성공');";
			htmlBody += "location.href='" + request.getContextPath() + "/member/index';";
			htmlBody += "</script>";
		}
		else {
			htmlBody += "<script>";
			htmlBody += "alert('아이디와 비밀번호를 확인하세요.');";
			htmlBody += "history.go(-1);";
			htmlBody += "</script>";
		}
		
		return new ResponseEntity<Object> (htmlBody, responseHeaders , HttpStatus.OK);
	}
	
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return new ModelAndView("redirect:/member/index");
	}
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public ModelAndView register() throws Exception {
		return new ModelAndView("member/register");
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public ResponseEntity<Object> register(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		memberService.registerMember(memberDto);
		
		String htmlBody = "<script>";
			   htmlBody += "alert('회원가입 완료!');";
			   htmlBody += "location.href='" + request.getContextPath() + "/member/login';";
			   htmlBody += "</script>";
			   
		return new ResponseEntity<Object> (htmlBody, responseHeaders , HttpStatus.OK);
	}
	
	@RequestMapping(value="/userCheck" , method=RequestMethod.POST)
	public ResponseEntity<Object> userCheck(@RequestParam("galleryId") String galleryId) throws Exception {
		return new ResponseEntity<Object>(memberService.overlapped(galleryId) , HttpStatus.OK);
	}
	
	@RequestMapping(value="/nameCheck" , method=RequestMethod.POST)
	public ResponseEntity<Object> nameCheck(@RequestParam("galleryNickname") String galleryNickname) throws Exception {
		return new ResponseEntity<Object>(memberService.nameCheck(galleryNickname) , HttpStatus.OK);
	}
	
	@RequestMapping(value="/password" , method=RequestMethod.GET)
	public ModelAndView password() throws Exception {
		return new ModelAndView("member/password");
	}
	
	@RequestMapping(value="/myPage" , method=RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request , Model model) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/MyPage");
		
		HttpSession session = request.getSession();
		mv.addObject("memberDto" , memberService.showOneMember((String)session.getAttribute("loginUser")));
		
		return mv;
		
	}	
	

	
	
	
}
