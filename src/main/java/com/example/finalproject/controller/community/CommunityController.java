package com.example.finalproject.controller.community;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.community.dto.CommunityDTO;
import com.example.finalproject.service.community.CommunityService;


@Controller
@RequestMapping("community/*") //공통 url
public class CommunityController {
	
	@Inject
	CommunityService communityService;
	
	@RequestMapping("list.do") //세부 url 
	public ModelAndView list(ModelAndView mav) { 
		//포워딩 
		mav.setViewName("/community/post_list"); 
		//전달할 데이터
		mav.addObject("list", communityService.listPost()); 
		return mav; 
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "community/write";
	}
	
	 	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CommunityDTO dto) throws Exception {
		String filename = "-";
		// 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "C:\\work_spring\\.metadata\\.plugins" 
			+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+ "\\OurfinalProject\\resources\\images\\community\\"; //배포 디렉토리
				// 디렉토리가 존재하지않으면 생성
				new File(path).mkdir();
				// 임시 디텍토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setComm_url(filename);
		communityService.create(dto);
		return "redirect:/community/list.do";
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(int comm_no, HttpSession session) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/post_detail");
		mav.addObject("dto", communityService.detailPost(comm_no));
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	

}
