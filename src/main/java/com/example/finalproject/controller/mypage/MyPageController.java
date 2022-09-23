package com.example.finalproject.controller.mypage;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.finalproject.HomeController;
import com.example.finalproject.service.mypage.MyPageService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("mypage/*")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Inject
	MyPageService mypageservice;
	
	@RequestMapping("mypagemain.do")
	public String main() {
		return "mypage/myPageMain";
	}
}
