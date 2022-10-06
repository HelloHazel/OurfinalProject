package com.example.finalproject.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.community.dto.CommunityDTO;
import com.example.finalproject.model.inquery.dto.InqueryDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.service.community.CommunityService;
import com.example.finalproject.service.inquery.InqueryService;
import com.example.finalproject.service.member.MemberService;
import com.example.finalproject.service.mypage.MyPageService;
import com.example.finalproject.service.shipping.ShippingService;

@Controller
@RequestMapping("mypage/*")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Inject
	MyPageService mypageservice;
	
    @Inject 
    MemberService memberService;
    
    @Inject 
    CommunityService communityService;
	 
    @Inject
	InqueryService inqueryService;
    
    @Inject
   	ShippingService shippingService;
	

	
	@RequestMapping("myquery.do")
	public ModelAndView my_query(HttpSession session) {
		 ModelAndView mav=new ModelAndView();
			//세션 아이디
			String userId=(String)session.getAttribute("userid");
		
			List<InqueryDTO> list=inqueryService.myquerylist(userId);
			
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			
			mav.setViewName("mypage/myQuery"); //포워딩 뷰
			mav.addObject("map", map);
			return mav;
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
	
	   /**
	    *  마이페이지 - 나의 게시글내역 조회
	    * @param mav
	    * @param session
	    * @return
	    */
		 @RequestMapping("myCmmList.do") 
			public ModelAndView list(HttpSession session){ 
			 ModelAndView mav=new ModelAndView();
			//세션 아이디
			String userId=(String)session.getAttribute("userid");

			List<CommunityDTO> list=communityService.myCmmList(userId);
			
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			System.out.println(list);
			
			mav.setViewName("mypage/myPost"); //포워딩 뷰
			mav.addObject("map", map);
			return mav;
		}
		 
			@RequestMapping("mypagemain.do")
			public ModelAndView main(HttpSession session) {
				//세션변수 확인
				String userid=(String)session.getAttribute("userid");
				if(userid !=null){//로그인한 경우
					ModelAndView mav=new ModelAndView();
					
					String userId=(String)session.getAttribute("userid");

					List<ShippingDTO> list=shippingService.myShippingList(userId);
					
					Map<String, Object> map=new HashMap<>();
					map.put("list", list);
					
					System.out.println(list);
					mav.setViewName("mypage/myPageMain"); //포워딩 뷰
					mav.addObject("map", map);
					return mav;
				
				}else { //로그인하지 않은 경우
					ModelAndView mav=new ModelAndView();
					mav.setViewName("member/login");
					return mav;
				}
			}
		 

		 
		
}
