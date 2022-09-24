package com.example.finalproject.controller.shop;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("shop/cart/*")
public class CartController {

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
