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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView list(
			@RequestParam(defaultValue = "userid") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) 
			throws Exception {
		
		//레코드 갯수 계산
		int count=noticeService.getTotalRow();
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<NoticeDTO> list=noticeService.list(search_option,keyword,start,end);
		logger.info(list.toString());
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);//레코드의 갯수
		map.put("pager", pager); //페이지네이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("notice/list");//포워딩 뷰
		mav.addObject("map", map);
		return mav;
	}
	
	// 질문답변 보기
	@GetMapping("view.do")
	public ModelAndView view(int no, HttpSession session) throws Exception {
	//조회수 증가 처리
		noticeService.increase(no, session);
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=noticeService.view(no);
		dto.setContent(dto.getContent().replace("\n", "<br>"));
		mav.setViewName("notice/view");
		mav.addObject("dto", dto);
			return mav;
			}
	
	@GetMapping("write.do")
	public String writeForm() throws Exception {	
			return "notice/write";
		}
	
	@PostMapping("write.do")
	public String write(NoticeDTO dto, HttpSession session) throws Exception{
			// id는 session에서
		String userid=(String)session.getAttribute("userid"); 
		dto.setUserid(userid);
					
		noticeService.write(dto);
		
		return "redirect:list.do";
	}
	
	@GetMapping("update.do")
	public String updateForm(int no, Model model) throws Exception{
		
		model.addAttribute("dto", noticeService.view(no));
		
		return "notice/update";
	}
	
	@PostMapping("update.do")
	public String update(NoticeDTO dto) throws Exception{
		
		noticeService.update(dto);
		
		return "redirect:view.do?no="+dto.getNo();
	}

	@GetMapping("delete.do")
	public String delete(int no) throws Exception {
		
		noticeService.delete(no);
		
		return "redirect:list.do";
	}
}
