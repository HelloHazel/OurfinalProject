package com.example.finalproject.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("community/*")
public class CommunityController {
	

	@RequestMapping("list.do")
	public String list(Model model) {
		model.addAttribute("message","홈페이지 방문을 환영합니다.");
		return "community/post_list";
	}

}
