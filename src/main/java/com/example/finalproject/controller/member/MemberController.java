package com.example.finalproject.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.HomeController;
import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		//로그인이 성공 true, 실패 false
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result) {
			//성공인 경우
			mav.setViewName("main");
		}else {
			mav.setViewName("member/login");
			//뷰에 전달할 값
			mav.addObject("message", "error");
		}
		return mav;
		
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		//login.jsp로 이동
		mav.setViewName("main");
		return mav;
	}
	
	//아이디 찾기 페이지로 이동
	@RequestMapping("findId.do")
	public String findId() {
		return "member/findId";
	}
	
	//아이디 찾기
	@RequestMapping("find_id.do")
	public String find_id(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("email") String email, Model model) throws Exception{
		model.addAttribute("userid", memberService.find_id(response, name, email));
		return "member/findIdResult";
	}
	
	//비밀번호 찾기 페이지로 이동
		@RequestMapping("findpw.do")
		public String findPw() {
			return "member/findPw";
		}
		
		//비밀번호 찾기
		@RequestMapping("find_pw.do")
		public String find_pw(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("userid") String userid, @RequestParam("email") String email, Model model) throws Exception{
			model.addAttribute("passwd", memberService.find_pw(response, name, userid, email));
			return "member/findPwResult";
		}
}
