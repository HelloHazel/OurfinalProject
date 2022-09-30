package com.example.finalproject.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//로그인 페이지 이동
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	//로그인 확인
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
		
		//회원정보 저장
		@RequestMapping("write.do")
		public String insert(@ModelAttribute MemberDTO dto) {
			memberService.insertMember(dto);
			return "main";
		}
		
		//아이디 중복 체크
		@ResponseBody
		@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
		public int idCheck(String userid) throws Exception{
			int result = memberService.idCheck(userid);
			return result;
		}
		
		//이메일 중복 체크
				@ResponseBody
				@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
				public int emailCheck(String email) throws Exception{
					int result = memberService.emailCheck(email);
					return result;
				}
				
		//회원수정
		@RequestMapping("update.do")
		public String update(MemberDTO dto, Model model) {
		//비번 체크
		boolean result=memberService.checkPw(dto.getUserid(), dto.getPasswd());
			if(result) {//비번이 맞으면
				//회원정보수정
				memberService.updateMember(dto);
				return "main";
				}else {
				model.addAttribute("dto", dto);
				model.addAttribute("join_date", memberService.viewMember(dto.getUserid()).getJoin_date());
				model.addAttribute("message", "비밀번호를 확인하세요.");
				return "mypage/myInfo";
					}
				}
		
		//회원삭제
		@RequestMapping("delete.do")
		public String delete(String userid, String passwd, Model model) {
			boolean result=memberService.checkPw(userid, passwd);
			if(result) {
				memberService.deleteMember(userid);
				return "main";
			}else {
				model.addAttribute("message", "비밀번호를 확인하세요.");
				model.addAttribute("dto", memberService.viewMember(userid));
				return "mypage/myInfo";
			}
		}
}
