package com.example.finalproject.controller.shipping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.CartDTO;
import com.example.finalproject.service.member.MemberService;
import com.example.finalproject.service.shipping.ShippingService;
import com.example.finalproject.service.shop.CartService;

@Controller
@RequestMapping("shipping/*")

public class ShippingController {
	@Inject
	CartService cartService;
	@Inject
	ShippingService shippingService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("orderList.do")
	public ModelAndView list(HttpSession session, MemberDTO dto, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		//세션 변수 확인
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {//로그인 한 경우
			List<CartDTO> list = cartService.listCart(userid);
			List<MemberDTO> info = memberService.addressInfo(userid);
			//장바구니 합계 계산
			int sumMoney = cartService.sumMoney(userid);
			//배송비 계산
			int fee = sumMoney >= 30000 ? 0 : 2500; //합계 3만원 이상이면 배송비 0원,미만이면 2500원
			map.put("sumMoney", sumMoney); //장바구니 금액 합계
			map.put("fee", fee); //배송비
			map.put("sum", sumMoney + fee); //총 합계 금액
			
			map.put("list", list);//맵에 자료 추가
			map2.put("info",info);
			map.put("count", list.size());
			mav.setViewName("shop/order");
			mav.addObject("map", map);
			mav.addObject("map2",map2);
			
			
			return mav;
		} else { //로그인하지 않은 경우
			return new ModelAndView("member/login", "", null);		
		}
	}
	
	@RequestMapping("insert.do")
	public String insert(HttpSession session, @ModelAttribute ShippingDTO dto) {
		String userid = (String)session.getAttribute("userid");
		dto.setUserid(userid);
		shippingService.insert(dto);
		return "main";
	}
	
}
