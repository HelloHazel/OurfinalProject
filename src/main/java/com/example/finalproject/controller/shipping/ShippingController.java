package com.example.finalproject.controller.shipping;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.model.shipping.dto.OrderListDTO;
import com.example.finalproject.model.shipping.dto.Order_detailDTO;
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
	public ModelAndView list(HttpSession session, MemberDTO dto, ShippingDTO dto2, ModelAndView mav) {
		
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
			
			Calendar cal = Calendar.getInstance();
			 int year = cal.get(Calendar.YEAR);
			 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
			 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
			 String subNum = "";
			 
			 for(int i = 1; i <= 6; i ++) {
			  subNum += (int)(Math.random() * 10);
			 }
			 
			 String order_id = ymd + "_" + subNum;
			dto2.setOrder_id(order_id);
			map.put("sumMoney", sumMoney); //장바구니 금액 합계
			map.put("fee", fee); //배송비
			map.put("sum", sumMoney + fee); //총 합계 금액
			
			map.put("list", list);//맵에 자료 추가
			map2.put("info",info);
			map.put("count", list.size());
			mav.setViewName("shop/order");
			mav.addObject("map", map);
			mav.addObject("map2",map2);
			mav.addObject("order_id", order_id);
			
			return mav;
		} else { //로그인하지 않은 경우
			return new ModelAndView("member/login", "", null);		
		}
	}
	
	@RequestMapping("insert.do")
	public String insert(HttpSession session, @ModelAttribute ShippingDTO dto, Order_detailDTO orderDetail) {
		String userid = (String)session.getAttribute("userid");
		 String order_id = dto.getOrder_id();
		dto.setOrder_id(order_id);
		dto.setUserid(userid);
		shippingService.insert(dto);
		
		orderDetail.setORDER_ID(order_id);
		orderDetail.setUserid(userid);
		shippingService.orderInfo_Details(orderDetail);
		
		 cartService.deleteAll(userid);
		return "main";
	}
	
	
}
