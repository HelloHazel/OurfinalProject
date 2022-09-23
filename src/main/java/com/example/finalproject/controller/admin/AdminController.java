package com.example.finalproject.controller.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.finalproject.service.admin.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
		@Inject
		AdminService adminService;
		
		@RequestMapping("login.do")
		public String login() {
			return "admin/login";
		}
}
