package com.example.finalproject.controller.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.faq.dto.FaqDTO;
import com.example.finalproject.service.faq.FaqService;
import com.example.finalproject.service.notice.Pager;

@Controller
@RequestMapping("faq/*") //공통 url
public class FaqController {
	
	//로거
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	
	@Inject FaqService faqService;
	 
	
	@RequestMapping("list.do") //세부url
	public ModelAndView list(
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		//레코드 갯수 계산
		int count=faqService.countFaq();
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<FaqDTO> list=faqService.list(start,end);
		logger.info(list.toString());
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);//레코드의 갯수
		map.put("pager", pager); //페이지네이션을 위한 변수
		mav.setViewName("faq/faq_detail");//포워딩 뷰
		mav.addObject("map", map);
		return mav;
		}
	
	@RequestMapping("create.do")
	public String create(FaqDTO dto, HttpSession session) throws Exception {
		String userid=(String) session.getAttribute("userid");
		dto.setUserid(userid);
		
		faqService.insert(dto);
		
		return "redirect:/faq/list.do";
	}
	
	
		
	@RequestMapping("write.do")
	public String write() {
		return "faq/faq_write";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int faq_no) throws Exception {
		System.out.println("faq_no : " + faq_no);
		faqService.delete(faq_no);
		return "redirect:/faq/list.do";
	}
	
}
