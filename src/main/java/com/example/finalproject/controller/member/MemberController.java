package com.example.finalproject.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.finalproject.HomeController;
import com.example.finalproject.service.member.MemberService;

public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
}
