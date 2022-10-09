package com.example.finalproject.controller.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.shop.dto.ReviewDTO;
import com.example.finalproject.service.shop.ReviewService;

@RestController
@RequestMapping("review/*")
public class ReviewController {
	@Inject
	ReviewService reviewService;
	
	@RequestMapping("insert.do")
	public void inset(ReviewDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		reviewService.create(dto);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int product_id, ModelAndView mav) {
		List<ReviewDTO> list=reviewService.list(product_id);//댓글 목록
		mav.setViewName("product/review_list");
		mav.addObject("list", list);
		return mav;
	}

}
