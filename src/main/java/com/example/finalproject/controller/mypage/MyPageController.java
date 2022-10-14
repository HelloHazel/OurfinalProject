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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.community.dto.CommunityDTO;
import com.example.finalproject.model.inquery.dto.InqueryDTO;
import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.model.shipping.dto.OrderListDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.ReviewDTO;
import com.example.finalproject.service.community.CommunityService;
import com.example.finalproject.service.inquery.InqueryService;
import com.example.finalproject.service.member.MemberService;
import com.example.finalproject.service.mypage.MyPageService;
import com.example.finalproject.service.shipping.ShippingService;
import com.example.finalproject.service.shop.ReviewService;

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
    
    @Inject
   	ReviewService reviewService;

	
	

	
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
					
					List<OrderListDTO> list=shippingService.orderView(userId);
					List<ShippingDTO> list1=shippingService.myShippingList(userId);
					
					Map<String, Object> map=new HashMap<>();
					Map<String, Object> map1=new HashMap<>();
					
					  map.put("list",list);
					  map1.put("list1",list1);
					  
					  mav.addObject("map",map);
					  mav.addObject("map1",map1);
					  
					mav.setViewName("mypage/myPageMain");
					
					return mav;
					
				}else { //로그인하지 않은 경우
					ModelAndView mav=new ModelAndView();
					mav.setViewName("member/login");
					return mav;
				}
			}
		 

			@RequestMapping("myreview.do")
			public ModelAndView my_reivew(HttpSession session) {
				 ModelAndView mav=new ModelAndView();
					//세션 아이디
					String userId=(String)session.getAttribute("userid");
				
					List<ReviewDTO> list=reviewService.myReviewList(userId);
					
					Map<String, Object> map=new HashMap<>();
					map.put("list", list);
					
					mav.setViewName("mypage/myReview"); //포워딩 뷰
					mav.addObject("map", map);
					return mav;
			}
			
			@RequestMapping("orderDetail/{order_id}")
			public ModelAndView myOrderDetail(@PathVariable String order_id, HttpSession session,  ModelAndView mav) {
				
				String userid=(String)session.getAttribute("userid");
				
					String userId=(String)session.getAttribute("userid");
					
					List<OrderListDTO> list=shippingService.orderView(userId);
					List<ShippingDTO> list1=shippingService.myShippingList(userId);
					
					
					Map<String, Object> map=new HashMap<>();
					Map<String, Object> map1=new HashMap<>();
					  
					  map.put( "order_id", order_id);
					  map.put("list",list);
					  map1.put("list1",list1);
			
					  mav.addObject("map",map);
					  mav.addObject("map1",map1);
	
					mav.setViewName("mypage/myOrderDetail");
					
					return mav;
			}
}
