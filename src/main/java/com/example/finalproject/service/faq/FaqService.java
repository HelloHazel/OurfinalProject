package com.example.finalproject.service.faq;

import java.util.List;

import com.example.finalproject.model.faq.dto.FaqDTO;

public interface FaqService {
	//리스트
		public List<FaqDTO> list(int start, int end) throws Exception;
		//faq 갯수
		public int countFaq();
		//보기
		public FaqDTO view(int faq_no) throws Exception;
		//조회수 증가 처리
		public void increaseViewcnt(int faq_no) throws Exception;
		//faq 작성
		public void insert(FaqDTO dto); 
		//faq 수정
		public void update(FaqDTO dto); 
		//faq 삭제
		public void delete(int faq_no);

}
