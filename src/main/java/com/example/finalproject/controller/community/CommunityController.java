package com.example.finalproject.controller.community;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.community.dto.CommunityDTO;
import com.example.finalproject.service.community.CommunityService;
import com.example.finalproject.service.community.Pager;


@Controller
@RequestMapping("community/*") //공통 url
public class CommunityController {
	
	//로거
	private static final Logger logger=LoggerFactory.getLogger(CommunityController.class);
	
	@Inject
	CommunityService communityService;
	
	@RequestMapping("list.do") //세부 url 
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage) 
			throws Exception { 
		//레코드 갯수 계산
		int count=communityService.countArticle();
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();	
		
		List<CommunityDTO> list=communityService.listPost(start, end);
		logger.info(list.toString());
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count); //레코드의 갯수
		map.put("pager", pager); //페이지네이션을 위한 변수
		mav.setViewName("community/post_list"); //포워딩 뷰
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "community/write";
	}
	
	 	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CommunityDTO dto) throws Exception {
		System.out.println("comm번호 : "+dto.getComm_no());
		
		
		
		String filename = "-";
		// 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "C:\\work_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OurfinalProject\\WEB-INF\\views\\images\\community\\";//배포 디렉토리
			    // 디렉토리가 존재하지않으면 생성
				new File(path).mkdir();
				// 임시 디텍토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setComm_url(filename);
		communityService.create(dto);
		return "redirect:/community/list.do";
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(int comm_no, HttpSession session) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/post_detail");
		mav.addObject("dto", communityService.detailPost(comm_no));
		return mav;
	}
	
	// edit/6
		@RequestMapping("edit/{comm_no}")
		public ModelAndView edit(@PathVariable("comm_no") int comm_no, ModelAndView mav) {
			mav.setViewName("community/post_edit");
			mav.addObject("dto", communityService.detailPost(comm_no));
			return mav;
		}
	
	//post 수정
	@RequestMapping("update.do")
	public String update(CommunityDTO dto) throws Exception {
		String filename = "-";
		//새로운 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "C:\\work_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OurfinalProject\\WEB-INF\\views\\images\\community\\";//배포 디렉토리
				// 디렉토리가 존재하지않으면 생성
				new File(path).mkdir();
				// 임시 디텍토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setComm_url(filename);
		} else { //새로운 첨부파일이 없을 때
			//기존에 첨부한 파일 정보를 가져옴
			CommunityDTO dto2=communityService.detailPost(dto.getComm_no());
			dto.setComm_url(dto2.getComm_url());
		}
		//post 수정
		communityService.update(dto);
		return "redirect:/community/list.do";
	}
	
	//post 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int comm_no) throws Exception {
		//첨부파일 삭제
		String filename=communityService.getAttach(comm_no);
		System.out.println("첨부파일 이름 : " + filename);
		if(filename != null && !filename.equals("-")) { //파일이 있으면
			String path = "C:\\work_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OurfinalProject\\WEB-INF\\views\\images\\community\\";//배포 디렉토리
			File f=new File(path + filename);
			System.out.println("파일존재여부 : " + f.exists());
			if(f.exists()) { //파일이 존재하면
				f.delete(); //파일목록 삭제
				System.out.println("파일이 삭제되었습니다.");
			}
		}
		//레코드 삭제
		communityService.delete(comm_no);
		return "redirect:/community/list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	

}
