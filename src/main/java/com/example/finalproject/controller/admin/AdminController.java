package com.example.finalproject.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.model.shipping.dto.OrderListDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.service.member.MemberService;
import com.example.finalproject.service.shipping.ShippingService;
import com.example.finalproject.service.shop.CartService;
import com.example.finalproject.service.shop.ProductService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
		
		@Inject
		ProductService productService;
		@Inject
		ShippingService shippingService;
		@Inject
		MemberService memberService;
		
		@RequestMapping("write.do")
		public String write() {
			return "admin/admin_product_write";
		}
		
		@RequestMapping("list.do")
		public ModelAndView list(ModelAndView mav) {
			mav.setViewName("/admin/admin_product_list");
			mav.addObject("list", productService.listProduct());
			return mav;
		}
		
		 @RequestMapping("memberList.do")
		    public String memberList(Model model) {
		    	List<MemberDTO> list=memberService.list();
		    	model.addAttribute("list", list);
		    	return "admin/memberList";
		    }
		 

			 @RequestMapping("orderList.do") 
			 public String orderList(Model model) {
			 List<OrderListDTO> list=shippingService.orderList();
			 model.addAttribute("list", list); return "admin/orderList"; 
			 }
			
}
