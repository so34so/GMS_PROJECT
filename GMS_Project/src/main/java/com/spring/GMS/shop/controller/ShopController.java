package com.spring.GMS.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.admin.service.AdminService;
import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.shop.service.ShopService;

@Controller
@RequestMapping("shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/Homepage" , method=RequestMethod.GET)
	public ModelAndView Homepage(@RequestParam(name = "onePageViewCount"  , defaultValue = "24")    int onePageViewCount,
								 @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
								 @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
								 @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/Homepage");
		
		
		// 페이지의 시작 게시글 인덱스
		int startBoardIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startBoardIdx = 0;
		
		
		// 관련 정보 Map 생성 ( 한페이지에 보여줄 게시글 숫자 , 시작페이지의 인덱스 , 검색 키워드 , 검색어 ) 
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startBoardIdx"    , startBoardIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		List<AdminDto> artList = adminService.getSearchart(searchInfo);
		
		// 게시글의 전체 개수를 반환하는 관련정보 Map 생성 ( 검색 키워드 , 검색어 ) 
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		// 전체페이지 개수 = 전체게시글 수 / 한페이지에서 보여지는 글수
		int totalBoardCount = adminService.getAllArtCount(searchCountInfo);
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
		mv.addObject("artList"      , artList);		
		
		
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
	
	@RequestMapping(value="/itemsale" , method=RequestMethod.GET)
	public ModelAndView itemsale(@RequestParam("artImage") String artImage) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/item");
		  
		mv.addObject("artInfo" , adminService.selectshowName(artImage));
		 
		return mv;
	}
	
	@RequestMapping(value="/shoporder" , method=RequestMethod.GET)
	public ModelAndView shoporder(@RequestParam("artImage") String artImage) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/shoporder");
		  
		mv.addObject("artInfo" , adminService.selectshowName(artImage));
		 
		return mv;
	}
	
}