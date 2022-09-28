package com.example.finalproject.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.notice.dto.NoticeDTO;
import com.example.finalproject.service.notice.NoticeService;

@Controller
@RequestMapping("notice/*")
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		List<NoticeDTO> list=noticeService.listAll();
		logger.info(list.toString());
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", list.size()); // 레코드 갯수
		mav.setViewName("notice/list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("insert.do")
	public String insert(@ModelAttribute NoticeDTO dto, HttpSession session) throws Exception {
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		// 레코드 저장
		noticeService.create(dto);
		// 게시물 목록 이동
		return "redirect:/notice/list.do";
	}
}
