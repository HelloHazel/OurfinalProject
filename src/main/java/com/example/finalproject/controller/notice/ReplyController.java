package com.example.finalproject.controller.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.notice.dto.ReplyDTO;
import com.example.finalproject.service.notice.ReplyService;

@RestController
@RequestMapping("reply/*")
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@PostMapping("insert.do")
	public void insert(@ModelAttribute ReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		// 레코드 저장
		replyService.create(dto);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int bno, ModelAndView mav) {
		List<ReplyDTO> list=replyService.list(bno);//댓글 목록
		mav.setViewName("notice/view");
		mav.addObject("list", list);
		return mav;
	}

}
