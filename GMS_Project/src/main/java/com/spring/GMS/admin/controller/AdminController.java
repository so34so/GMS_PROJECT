package com.spring.GMS.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.admin.service.AdminService;


@Controller
@RequestMapping("admin")
public class AdminController {
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	String seperatorPath = "\\";	// window

	//private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
	//String seperatorPath = "/";		// linux
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/adminpage" , method=RequestMethod.GET)
	public ModelAndView adminpage() throws Exception  {
		return new ModelAndView("admin/adminpage");
	}
	
	@RequestMapping(value="/adminuser" , method=RequestMethod.GET)
	public ModelAndView adminuser(@RequestParam(name = "onePageViewCount"  , defaultValue = "10")    int onePageViewCount,
									  @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
									  @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
									  @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord) throws Exception {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminuser");
		
		
		// 페이지의 시작 게시글 인덱스
		int startBoardIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startBoardIdx = 0;
		
		
		// 관련 정보 Map 생성 ( 한페이지에 보여줄 게시글 숫자 , 시작페이지의 인덱스 , 검색 키워드 , 검색어 ) 
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startBoardIdx"    , startBoardIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		List<MemberDto> userList = adminService.allUserList(searchInfo);
		
		// 게시글의 전체 개수를 반환하는 관련정보 Map 생성 ( 검색 키워드 , 검색어 ) 
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		// 전체페이지 개수 = 전체게시글 수 / 한페이지에서 보여지는 글수
		int totalBoardCount = adminService.getAlluserCount(searchCountInfo);
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
		mv.addObject("userList"      , userList);		
		
		
		/*
		System.out.println("====================================");
		System.out.println("startPage : "         + startPage);
		System.out.println("endPage : "           + endPage);
		System.out.println("totalBoardCount : "   + totalBoardCount);
		System.out.println("onePageViewCount : "  + onePageViewCount);
		System.out.println("currentPageNumber : " + currentPageNumber);
		System.out.println("searchKeyword : "     + searchKeyword);
		System.out.println("searchWord : "        + searchWord);
		System.out.println("====================================\n");
		*/
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/admincategory" , method=RequestMethod.GET)
	public ModelAndView admincategory(@RequestParam(name = "onePageViewCount"  , defaultValue = "10")    int onePageViewCount,
									  @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
									  @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
									  @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord) throws Exception {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admincategory");
		
		
		// 페이지의 시작 게시글 인덱스
		int startBoardIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startBoardIdx = 0;
		
		
		// 관련 정보 Map 생성 ( 한페이지에 보여줄 게시글 숫자 , 시작페이지의 인덱스 , 검색 키워드 , 검색어 ) 
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startBoardIdx"    , startBoardIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		List<AdminDto> categoryList = adminService.getSearchBoard(searchInfo);
		
		// 게시글의 전체 개수를 반환하는 관련정보 Map 생성 ( 검색 키워드 , 검색어 ) 
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		// 전체페이지 개수 = 전체게시글 수 / 한페이지에서 보여지는 글수
		int totalBoardCount = adminService.getAllBoardCount(searchCountInfo);
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
		mv.addObject("categoryList"      , categoryList);		
		
		
		System.out.println("====================================");
		System.out.println("startPage : "         + startPage);
		System.out.println("endPage : "           + endPage);
		System.out.println("totalBoardCount : "   + totalBoardCount);
		System.out.println("onePageViewCount : "  + onePageViewCount);
		System.out.println("currentPageNumber : " + currentPageNumber);
		System.out.println("searchKeyword : "     + searchKeyword);
		System.out.println("searchWord : "        + searchWord);
		System.out.println("====================================\n");
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/adminproduct" , method=RequestMethod.GET)
	public ModelAndView adminproduct(@RequestParam("artArtnum") String artArtnum) throws Exception  {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminproduct");
		
		mv.addObject("adminDto" ,adminService.selectartArtnum(artArtnum));
		
		return mv;
	}
	
	@RequestMapping(value="/modifyInfo" , method=RequestMethod.POST)
	public ResponseEntity<String> modifyGoodsInfo(@RequestParam("artArtnum") int artArtnum,
			                     		     @RequestParam("attribute") String attribute,
			                     		     @RequestParam("value") String value) throws Exception {
		
		Map<String,Object> goodsMap = new HashMap<String,Object>();
		goodsMap.put("artArtnum" , artArtnum);
		goodsMap.put(attribute , value);
		adminService.modifyInfo(goodsMap);
		
		return new ResponseEntity<String>(HttpStatus.OK);

	}
	
	@RequestMapping(value="/categoryadd" , method=RequestMethod.GET)
	public ModelAndView categoryadd() throws Exception  {
		return new ModelAndView("admin/categoryadd");
	}
	
	@RequestMapping(value="/modifyImageInfo" , method=RequestMethod.POST)
	public ResponseEntity<String> modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFileName = "";
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + uploadFile.getOriginalFilename());	
			uploadFile.transferTo(f); 

			originalFileName = uploadFile.getOriginalFilename();
		}
		Map<String,Object> goodsMap = new HashMap<String,Object>();
		int artArtnum = Integer.parseInt(multipartRequest.getParameter("artArtnum"));
		goodsMap.put("artArtnum" , artArtnum);
		goodsMap.put("artImage" , originalFileName);
		adminService.modifyInfo(goodsMap);
		
		return new ResponseEntity<String>(HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/categoryadd" , method=RequestMethod.POST)
	public ResponseEntity<String> categoryadd(MultipartHttpServletRequest multipartRequest , HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		AdminDto adminDto = new AdminDto();
		adminDto.setArtStatus(multipartRequest.getParameter("artStatus"));
		adminDto.setShowName(multipartRequest.getParameter("showName"));
		adminDto.setArtTitle(multipartRequest.getParameter("artTitle"));
		adminDto.setArtist(multipartRequest.getParameter("artist"));
		adminDto.setStartDate(fm.parse(multipartRequest.getParameter("startDate")));
		adminDto.setEndDate(fm.parse(multipartRequest.getParameter("endDate")));
		adminDto.setArtContent(multipartRequest.getParameter("artContent"));
		adminDto.setMainArt(multipartRequest.getParameter("mainArt"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				
				String fileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + fileName);	
				uploadFile.transferTo(f); 
				adminDto.setartImage(fileName);
			}
		
		}
		
		adminService.categoryadd(adminDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message= "<script>";
			   message += " alert('카테고리 등록 성공');";
			   message +=" location.href='" + multipartRequest.getContextPath() + "/admin/admincategory';";
			   message +="</script>";
		
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/deleteInfo" , method = RequestMethod.POST)
	public ResponseEntity<Object> categorydelete(@RequestParam("artArtnum") int artArtnum , HttpServletRequest request) throws Exception {
        
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
    	adminService.deleteInfo(artArtnum);
		
    	return new ResponseEntity<Object> (responseHeaders , HttpStatus.OK);
                
    }
	
	@RequestMapping(value="/adminorder" , method=RequestMethod.GET)
	public ModelAndView adminorder() {
		return new ModelAndView("admin/adminorder");
	}
	
	@RequestMapping(value="/memberExcelExport" , method=RequestMethod.GET)
	public void memberExcelExport(HttpServletResponse response , @RequestParam Map<String, String> dateMap) throws Exception {
		  
		SimpleDateFormat joinSdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_memberList.xls";
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원리스트");
	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    // 가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 노란색 배경
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원아이디");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원닉네임");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입일");
	    
		for (MemberDto memberDto :  adminService.userList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getGalleryId());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getGalleryName());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getGalleryNickname());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getRoadAddress() + " " + memberDto.getJibunAddress() + " " + memberDto.getNamujiAddress());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(joinSdf.format(memberDto.getJoinDate()));

		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();

		
	}
	
}
