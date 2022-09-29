package com.example.finalproject.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.notice.dto.NoticeDTO;
import com.example.finalproject.service.notice.NoticeService;
import com.example.finalproject.service.notice.Pager;

@Controller
@RequestMapping("notice/*")
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "name") String search_option,
	@RequestParam(defaultValue = "") String keyword,
	@RequestParam(defaultValue = "1") int curPage) throws Exception {
		// 레코드 갯수 계산
		int count=noticeService.countArticle(search_option, keyword);
		// 페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<NoticeDTO> list=noticeService.listAll(start, end);
		logger.info(list.toString());
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count); // 레코드 갯수
		map.put("pager", pager); // 페이지네이션을 위한 변수
		mav.setViewName("notice/list"); // 포워딩 뷰
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
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno, HttpSession session) throws Exception {
		// 조회수 증가처리
		noticeService.increaseViewcnt(bno, session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/view");
		mav.addObject("dto", noticeService.read(bno));
		
		return mav;
	}
	
	// 게시판 수정
	@RequestMapping("update.do")
	public String update(NoticeDTO dto) throws Exception{
		System.out.println("dto:"+dto);
		if(dto != null) {
			noticeService.update(dto);
		}
		//수정 완료 후 목록 화면으로..
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		noticeService.delete(bno);
		return "redirect:/notice/list.do";
	}
}
