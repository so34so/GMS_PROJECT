package com.spring.GMS.file;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class FileController {
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	String seperatorPath = "\\";	// window

	//private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
	//String seperatorPath = "/";		// linux
	
	@RequestMapping("/thumbnails")
	public void thumbnails(@RequestParam("artImage") String artImage , HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + seperatorPath + artImage;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(500,500).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	@RequestMapping("/image")
	public void image(@RequestParam("artistImage") String artistImage , HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + seperatorPath + artistImage;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(500,500).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
}
