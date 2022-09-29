package com.example.finalproject.controller.mypage;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.finalproject.HomeController;
import com.example.finalproject.service.member.MemberService;
import com.example.finalproject.service.mypage.MyPageService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("mypage/*")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Inject
	MyPageService mypageservice;
	
    @Inject MemberService memberService;
	 
	
	
	@RequestMapping("mypagemain.do")
	public String main(HttpSession session) {
		//세션변수 확인
		String userid=(String)session.getAttribute("userid");
		if(userid !=null)//로그인한 경우
		return "mypage/myPageMain";
		else //로그인하지 않은 경우
			return "member/login";
	}
	
	@RequestMapping("myquery.do")
	public String my_query() {
		return "mypage/myQuery";
	}
	
	@RequestMapping("mypost.do")
	public String my_post() {
		return "mypage/myPost";
	}
	
	@RequestMapping("myreview.do")
	public String my_review() {
		return "mypage/myReview";
	}
	
	@RequestMapping("myinfo.do")
	public String my_info( @RequestParam String userid, Model model ) {
		 model.addAttribute("dto", memberService.viewMember(userid)); 
		return "mypage/myInfo";
	}
}
