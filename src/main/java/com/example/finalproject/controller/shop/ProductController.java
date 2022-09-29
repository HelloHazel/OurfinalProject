package com.example.finalproject.controller.shop;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.shop.dto.ProductDTO;
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
	
	@RequestMapping("detail/{product_id}")
	//리턴 타입: ModelAndView, 메소드 이름:detail(들어오는값), RESTful 사용을 위한 @PathVariable 입력
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		//포워딩할 뷰
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename="-";
		//첨부 파일 있으면
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work_spring\\.metadata\\.plugins"
			+"\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+"\\OurfinalProject\\resources\\images\\";  //배포 디렉토리
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setProduct_url(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	}
	
	//edit
	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		mav.setViewName("shop/product_edit");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	//상품 정보 수정
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename="-";
		//새로운 첨부 파일 있으면
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work_spring\\.metadata\\.plugins"
						+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+ "\\OurfinalProject\\WEB-INF\\views\\images\\"; //배포 디렉토리
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setProduct_url(filename);
		}else {//새로운 첨부 파일이 없을 때
			//기존에 첨부한 파일 정보를 가져옴
			ProductDTO dto2=productService.detailProduct(dto.getProduct_id());
			dto.setProduct_url(dto2.getProduct_url());			
		}
		//상품 정보 수정
		productService.updateProduct(dto);
		return "redirect:/shop/product/list.do";
	}
	
}
