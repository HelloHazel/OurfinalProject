package com.example.finalproject.controller.inquery;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.inquery.dto.InqueryDTO;
import com.example.finalproject.service.inquery.InqueryService;
import com.example.finalproject.service.inquery.Pager;

@Controller
@RequestMapping("inquery/*")
public class InqueryController {
		private static final Logger logger=LoggerFactory.getLogger(InqueryController.class);
		
		@Inject
		InqueryService inqueryService;
		
		// 질문답변 리스트
		@RequestMapping("list.do")
		public ModelAndView list(
				@RequestParam(defaultValue = "userid") String search_option,
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int curPage) 
				throws Exception {
			
			//레코드 갯수 계산
			int count=inqueryService.getTotalRow();
			//페이지 관련 설정
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<InqueryDTO> list=inqueryService.list(search_option, keyword, start, end);
			logger.info(list.toString());
			ModelAndView mav=new ModelAndView();
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			map.put("count", count);//레코드의 갯수
			map.put("pager", pager); //페이지네이션을 위한 변수
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			mav.setViewName("inquery/list");//포워딩 뷰
			mav.addObject("map", map);
			return mav;
		}
		
		 
		 @GetMapping("question.do") 
		 public String questionForm() throws Exception {
		  return "inquery/question"; 
		  }
		
		// 질문하기 처리
		@PostMapping("question.do")
		public String question(@ModelAttribute InqueryDTO dto, HttpSession session) throws Exception {
			
			// id는 session에서
			String userid=(String)session.getAttribute("userid"); 
			dto.setUserid(userid);
			
			inqueryService.question(dto);

			return "redirect:list.do?no="+dto.getNo();
		}
		
		// 질문답변 보기
		@GetMapping("view.do")
		public ModelAndView view(int no, HttpSession session) throws Exception {
			//조회수 증가 처리
			inqueryService.increase(no, session);
			ModelAndView mav=new ModelAndView();
			InqueryDTO dto=inqueryService.view(no);
			dto.setContent(dto.getContent().replace("\n", "<br>"));
			mav.setViewName("inquery/view");
			mav.addObject("dto", dto);
			return mav;
		}
		
		// 답변하기 폼
		@GetMapping("answer.do")
		public String answerForm(int no, Model model) throws Exception {
			
			model.addAttribute("dto", inqueryService.view(no));
			
			return "inquery/answer";
		}
		
		// 답변하기 처리
		@PostMapping("answer.do")
		public String answer(int no, InqueryDTO dto, HttpSession session) throws Exception{
			
			// id는 session에서
			String userid=(String)session.getAttribute("userid"); 
		    dto.setUserid(userid);
			
			// db처리
			inqueryService.answer(dto);
			
			return "redirect:list.do?no="+dto.getNo();
		}
		
		// 수정폼
		@GetMapping("update.do")
		public String updateForm(int no, Model model) throws Exception{
			
			// db에서 데이터 가져오기
			model.addAttribute("dto", inqueryService.view(no));
			
			return "inquery/update";
		}
		
		// 수정처리
		@PostMapping("update.do")
		public String update(InqueryDTO dto) throws Exception{
					
			// db처리
			inqueryService.update(dto);
					
			return "redirect:view.do?no="+dto.getNo() + "&inc=0";
		}
		
		// 삭제처리
		@GetMapping("delete.do")
		public String delete(int no) throws Exception {
			// db처리
			inqueryService.delete(no);
			return "redirect:list.do";
		}
}