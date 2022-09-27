package com.example.finalproject.controller.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.service.shop.ProductService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
		
		@Inject
		ProductService productService;
		
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
		

}
