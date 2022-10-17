package com.example.finalproject.controller.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
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
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	 private final static String id = "5e271ef689167248b66474ccae13b1e6"; 
	 private final static String url = "http://localhost/finalproject/member/oauth_kakao";
	
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
		public String delete(String userid, String passwd, Model model, HttpSession session) {
			boolean result=memberService.checkPw(userid, passwd);
			if(result) {
				memberService.deleteMember(userid);
				memberService.logout(session);
				return "main";
			}else {
				model.addAttribute("message", "비밀번호를 확인하세요.");
				model.addAttribute("dto", memberService.viewMember(userid));
				return "mypage/myInfo";
			}
		}
	    
		//카카오톡 로그인
	    public static JsonNode getAccessToken(String autorize_code){ 
	        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	        final List<BasicNameValuePair> postParams = new ArrayList<BasicNameValuePair>();
	        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	        postParams.add(new BasicNameValuePair("client_id", id));    // REST API KEY
	        postParams.add(new BasicNameValuePair("redirect_uri", url));    // 리다이렉트 URI
	        postParams.add(new BasicNameValuePair("code", autorize_code));    // 로그인 과정중 얻은 code 값
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	        JsonNode returnNode = null;
	        try {
	            post.setEntity(new UrlEncodedFormEntity(postParams));
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Post parameters : " + postParams);
	            System.out.println("Response Code : " + responseCode);
	            
	            //JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	        }
	        return returnNode;
	    }
	    
	    public static JsonNode getKakaoUserInfo(String access_token) {
	        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	         String accessToken = access_token;
	         
	        // add header
	        post.addHeader("Authorization", "Bearer " + accessToken);
	        JsonNode returnNode = null;
	        try {
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	            //JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	        return returnNode;
	 
	    }
	    @RequestMapping(value="/oauth_kakao", method=RequestMethod.GET)
	    public String kakaologin(@RequestParam("code") String code,HttpSession session)throws Exception{
	        JsonNode jsonToken = getAccessToken(code);
	        String access_token = jsonToken.get("access_token").toString();
	        JsonNode userInfo = getKakaoUserInfo(access_token);
	        String id = userInfo.get("id").toString();
	        String name = userInfo.get("properties").get("nickname").toString();
	        UUID garbagePassword = UUID.randomUUID();
	         String email = userInfo.get("kakao_account").get("email").toString();
	        MemberDTO member = new MemberDTO();
	        member.setName(name);
	        member.setUserid(id);
	        member.setPasswd(garbagePassword.toString());
	        member.setEmail(email);
	        int result = memberService.emailCheck(member.getEmail());
			if(result == 0) {
				memberService.insertKakaoMember(member);
				session.setAttribute("userid", id);
		        session.setAttribute("name", name);
		        System.out.println(id+name);
		        return "main";
			}else {
				session.setAttribute("userid", id);
		        session.setAttribute("name", name);
		        System.out.println(id+name);
		        return "main";
	    }
	}
	    
	    @RequestMapping("list.do")
	    public String memberList(Model model) {
	    	List<MemberDTO> list=memberService.list();
	    	model.addAttribute("list", list);
	    	return "admin/memberList";
	    }
}
