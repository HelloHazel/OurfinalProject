package com.example.finalproject.controller.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.finalproject.service.shop.ProductService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
		
		@Inject
		ProductService productService;
		
		
}
