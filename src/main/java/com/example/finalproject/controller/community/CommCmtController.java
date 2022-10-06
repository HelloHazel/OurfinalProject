package com.example.finalproject.controller.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.community.dto.CommCmtDTO;
import com.example.finalproject.service.community.CommCmtService;

@Controller
@RequestMapping("commCmt/*")//공통 url
public class CommCmtController {
	
	@Inject
	CommCmtService commCmtService;
	
	@RequestMapping("insert.do")
	public void insert(CommCmtDTO dto, HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		dto.setCommenter(userid);
		commCmtService.create(dto);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int comm_no, ModelAndView mav) {
		List<CommCmtDTO> list=commCmtService.list(comm_no); //댓글 목록
		mav.setViewName("community/comment_list");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("list_json")
	public List<CommCmtDTO> list_json(int comm_no) {
		return commCmtService.list(comm_no);
	}

}
