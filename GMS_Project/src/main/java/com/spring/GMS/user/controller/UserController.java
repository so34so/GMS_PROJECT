package com.spring.GMS.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.admin.service.AdminService;
import com.spring.GMS.dto.ArtistDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;
import com.spring.GMS.member.service.MemberService;
import com.spring.GMS.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/update");
		
		mv.addObject("memberDto" ,   memberService.showOneMember((String)session.getAttribute("loginUser")));
		
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
		
		mv.addObject("memberDto" , memberService.showOneMember((String)session.getAttribute("loginUser")));
		
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
	
	@RequestMapping(value="/userorderdetail" , method=RequestMethod.GET)
	public ModelAndView userorderdetail(@RequestParam("orderId") int orderId,
										@RequestParam("galleryId") String galleryId,
										@RequestParam("artTitle") String artTitle) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userorderdetail");
		
		Map<String, Object> haveReview = new HashMap<String, Object>();
		haveReview.put("galleryId" , galleryId);
		haveReview.put("artTitle"    , artTitle);
		boolean SearchReview = userService.getSearchReview(haveReview);
		
		mv.addObject("orderMap", adminService.orderDetail(orderId));
		
		mv.addObject("Review" , SearchReview);
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/userorderList" , method=RequestMethod.GET)
	public ModelAndView userorderList(@RequestParam(name = "onePageViewCount"  , defaultValue = "10")    int onePageViewCount,
									  @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
									  @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
									  @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord,
									  HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userorderList");
		
		
		// 페이지의 시작 게시글 인덱스
		int startBoardIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startBoardIdx = 0;
		
		
		// 관련 정보 Map 생성 ( 한페이지에 보여줄 게시글 숫자 , 시작페이지의 인덱스 , 검색 키워드 , 검색어 ) 
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startBoardIdx"    , startBoardIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		List<ShopDto> orderList = adminService.getSearchOrder(searchInfo);
		
		// 게시글의 전체 개수를 반환하는 관련정보 Map 생성 ( 검색 키워드 , 검색어 ) 
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		// 전체페이지 개수 = 전체게시글 수 / 한페이지에서 보여지는 글수
		int totalBoardCount = adminService.getAllOrderCount(searchCountInfo);
		int addPage = totalBoardCount % onePageViewCount == 0 ? 0 : 1; 		// 나머지가 0이면 추가 x , 나머지가 0이 아니면 +1 페이지 처리
		int totalPageCount = totalBoardCount / onePageViewCount + addPage;
		
		
		// 시작페이지
		int startPage = 1;
		
		if (currentPageNumber % 10 == 0) startPage = (currentPageNumber / 10 - 1) * 10 + 1;
		else 							 startPage = (currentPageNumber / 10) * 10 + 1;							
		
		/*
		 
			[ 예시 ]  
			
			currentPage가 10페이면 시작페이지는 1  		<>		currentPage가 2페이지면  시작페이지는 1  
			currentPage가 20페이면 시작페이지는 11  	<>		currentPage가 12페이지면 시작페이지는 11  
			currentPage가 30페이면 시작페이지는 21 		<>		currentPage가 22페이지면 시작페이지는 21  
			
		*/
		
	
		
		// 끝페이지
		int endPage = startPage + 9;
			
		// 끝페이지가 전체 페이지 개수보다 크다면 
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		// 게시물이 한페이지에 보여지는 것보다 작다면
		if (onePageViewCount > totalBoardCount) {
			startPage = 1;
			endPage = 0;
		}
		
				
		mv.addObject("startPage"         , startPage);
		mv.addObject("endPage"           , endPage);
		mv.addObject("totalBoardCount"   , totalBoardCount);
		mv.addObject("onePageViewCount"  , onePageViewCount);
		mv.addObject("currentPageNumber" , currentPageNumber);
		mv.addObject("searchKeyword"     , searchKeyword);
		mv.addObject("searchWord"        , searchWord);
		mv.addObject("orderList"      , orderList);		
		
		
		/*
		 * System.out.println("====================================");
		 * System.out.println("startPage : " + startPage);
		 * System.out.println("endPage : " + endPage);
		 * System.out.println("totalBoardCount : " + totalBoardCount);
		 * System.out.println("onePageViewCount : " + onePageViewCount);
		 * System.out.println("currentPageNumber : " + currentPageNumber);
		 * System.out.println("searchKeyword : " + searchKeyword);
		 * System.out.println("searchWord : " + searchWord);
		 * System.out.println("====================================\n");
		 */
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/reviewwrite" , method=RequestMethod.GET)
	public ModelAndView reviewwrite(@RequestParam("artTitle") String artTitle , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/reviewwrite");
		mv.addObject("memberInfo", memberService.showOneMember((String)session.getAttribute("loginUser")));
		mv.addObject("artInfo" , adminService.selectartTitle(artTitle));
		
		return mv;
		
	}
	
	@RequestMapping(value="/reviewwrite" , method=RequestMethod.POST)
	public ResponseEntity<String> reviewwrite(MultipartHttpServletRequest multipartRequest , HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setArtTitle(multipartRequest.getParameter("artTitle"));
		reviewDto.setGalleryId(multipartRequest.getParameter("galleryId"));
		reviewDto.setGalleryNickname(multipartRequest.getParameter("galleryNickname"));
		reviewDto.setReviewTitle(multipartRequest.getParameter("reviewTitle"));
		reviewDto.setReviewContent(multipartRequest.getParameter("reviewContent"));
		reviewDto.setReviewRate(multipartRequest.getParameter("reviewRate"));
		
		userService.reviewadd(reviewDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message= "<script>";
			   message += " alert('리뷰 등록 성공');";
			   message +=" location.href='" + multipartRequest.getContextPath() + "/user/userorderList';";
			   message +="</script>";
		
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/reviewDetail" , method=RequestMethod.GET)
	public ModelAndView reviewDetail(	@RequestParam("galleryId") String galleryId,
										@RequestParam("artTitle") String artTitle) throws Exception {
							
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/reviewDetail");
		
		Map<String, Object> haveReview = new HashMap<String, Object>();
		haveReview.put("galleryId" , galleryId);
		haveReview.put("artTitle"    , artTitle);
		ReviewDto SearchReview = userService.getOneReview(haveReview);
		
		mv.addObject("Review" , SearchReview);
		
		return mv;
		
	}
	
	@RequestMapping(value="/deleteReview" , method=RequestMethod.GET)
	public ResponseEntity<Object> deleteReview( @RequestParam("artTitle") String artTitle, HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		
		Map<String, Object> haveReview = new HashMap<String, Object>();
		haveReview.put("galleryId" , (String)session.getAttribute("loginUser"));
		haveReview.put("artTitle"    , artTitle);
		
		userService.deleteReview(haveReview);
		
		return new ResponseEntity<Object> (responseHeaders , HttpStatus.OK);
		
	}
	@RequestMapping(value="/myPage" , method=RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/MyPage");
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		mv.addObject("memberDto" , memberService.showOneMember((String)session.getAttribute("loginUser")));
		mv.addObject("reviewList" , userService.showReviewList((String)session.getAttribute("loginUser")));
		mv.addObject("orderList" , userService.showOrderList((String)session.getAttribute("loginUser")));
		
		return mv;
		
	}	
}
