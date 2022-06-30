package com.spring.GMS.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
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
	public ModelAndView adminuser() throws Exception  {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminuser");
		mv.addObject("userList" , adminService.allUserList());
		
		return mv;
	}
	
	@RequestMapping(value="/admincategory" , method=RequestMethod.GET)
	public ModelAndView admincategory() throws Exception  {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admincategory");
		
		mv.addObject("categoryList" , adminService.listCategory());
		
		return mv;
	}
	
	@RequestMapping(value="/adminproduct" , method=RequestMethod.GET)
	public ModelAndView adminproduct() throws Exception  {
		return new ModelAndView("admin/adminproduct");
	}
	
	@RequestMapping(value="/categoryadd" , method=RequestMethod.GET)
	public ModelAndView categoryadd() throws Exception  {
		return new ModelAndView("admin/categoryadd");
	}
	
	@RequestMapping(value="/categoryadd" , method=RequestMethod.POST)
	public ResponseEntity<String> categoryadd(MultipartHttpServletRequest multipartRequest , HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		AdminDto adminDto = new AdminDto();
		adminDto.setArtStatus(multipartRequest.getParameter("artStatus"));
		adminDto.setShowName(multipartRequest.getParameter("showName"));
		adminDto.setArtist(multipartRequest.getParameter("artist"));
		adminDto.setStartDate(fm.parse(multipartRequest.getParameter("startDate")));
		adminDto.setEndDate(fm.parse(multipartRequest.getParameter("endDate")));
		
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				
				String fileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + fileName);	
				uploadFile.transferTo(f); 
				adminDto.setMainArt(fileName);
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
	
	@RequestMapping(value="/categorydelete" , method = RequestMethod.GET)
	public ResponseEntity<Object> categorydelete(@RequestParam("mainArt") String fileName , HttpServletRequest request) throws Exception {
        
		System.out.println(fileName);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type" , "text/html; charset=UTF-8");
		
		File file = new File(CURR_IMAGE_REPO_PATH + seperatorPath + fileName);		// 파일 정보를 읽어온다.
        
		String result = "";
		
    	if (file.exists()) {											// 읽어온 파일이 존재하면
    		file.delete();												// 파일을 삭제한다.
    		adminService.deleteFile("mainArt");
    		result= "<script>";
    		result += "alert('파일삭제 완료');";
    		result += "location.href='"+request.getContextPath()+"/admin/admincategory';";
    		result +="</script>";
    	} 
    	else {
    		result= "<script>";
    		result += "alert('삭제 실패');";
    		result += "history.go(-1);";
    		result +="</script>";
    	}
    	
    	return new ResponseEntity<Object> (result, responseHeaders , HttpStatus.OK);
                
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
	    
		for (MemberDto memberDto :  adminService.allUserList()) {
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
