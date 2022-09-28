package com.example.finalproject.controller.community;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		//글쓰기 폼 페이지로 이동
		return "community/write";
	}
	
	
	
	
	
	
	

}
