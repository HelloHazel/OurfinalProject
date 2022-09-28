package com.example.finalproject.controller.community;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String insert(@ModelAttribute CommunityDTO dto, HttpSession session) throws Exception {
		//이름이 없기 때문에 세션에서 사용자 ID를 가져옴
		String writer=(String) session.getAttribute("userid");
		dto.setUserid(writer);
		//레코드 저장
		communityService.create(dto);
		//게시물 목록으로 이동
		return "redirect:/community/list.do";
	}
	
	
	
	
	
	
	

}
