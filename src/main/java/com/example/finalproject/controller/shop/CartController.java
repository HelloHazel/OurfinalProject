package com.example.finalproject.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.shop.dto.CartDTO;
import com.example.finalproject.service.shop.CartService;

@Controller
@RequestMapping("shop/cart/*")
public class CartController {
	
	@Inject
	CartService cartService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		//세션 변수 확인
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {//로그인 한 경우
			List<CartDTO> list = cartService.listCart(userid);
			map.put("list", list);//맵에 자료 추가
			map.put("count", list.size());
			mav.setViewName("shop/cart_list");
			mav.addObject("map", map);
			return mav;
		} else { //로그인이 안 됐을 때
			return new ModelAndView("member/login", "", null);
			
		}
		
	}

	@RequestMapping("insert.do")//세부 url
	public String insert(HttpSession session) {
		//세션에 userid 변수가 존재하는지 확인
		String userid=(String)session.getAttribute("userid");
		if(userid == null) { //로그인 안 한 상태
			//포워딩이 아닌 redirect방식으로
			return "redirect:/member/login.do"; //로그인 페이지 이동
		}
		//로그인 된 상태 (장바구니에 insert 처리 후 장바구니 목록으로 이동)
		return "redirect:shop/cart/list.do";
	}
	

}
