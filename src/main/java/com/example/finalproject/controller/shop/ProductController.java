package com.example.finalproject.controller.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.service.shop.ProductService;

@Controller
@RequestMapping("shop/product/*")//공통 URL 처리 
public class ProductController {

	@Inject
	ProductService productService; //controller는 service와 연결
	
	@RequestMapping("list.do") //세부 url 요청
	public ModelAndView list(ModelAndView mav) { //data가 forwarding할 url을 함께 같이 처리
		//포워딩할 view의 경로
		mav.setViewName("/shop/product_list");
		//전달할 data
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	
	@RequestMapping("detail/${row.product_id}")
	//리턴 타입: ModelAndView, 메소드 이름:detail(들어오는값), RESTful 사용을 위한 @PathVariable 입력
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		//포워딩할 뷰
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
}
