package roomie.common.test;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class testController {

	@RequestMapping(value = "/test.da")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> param, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("test");

		
		return mv;

	}
	
	@PostMapping(value = "/test1.da")
	public ModelAndView updateForm2(@RequestParam("camera") MultipartFile file ,HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("test");
		
		//System.out.println(param);
		
		MultipartFile profUploadFile = file;
		

		String path = request.getSession().getServletContext().getRealPath("resources/img/");
		
		System.out.println("경로 주소 : " + path);
		

		if (!profUploadFile.isEmpty()) {
			String logoFileName = profUploadFile.getOriginalFilename(); // 저장할 로고 이미지 파일명

			profUploadFile.transferTo(new File(path + logoFileName)); // 업로드한 파일 저장
			
			System.out.println(">> 로고 이미지 업로드 파일 : " + logoFileName);
		}
		


		
		return mv;

	}

}
