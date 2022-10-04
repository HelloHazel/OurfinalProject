package com.example.finalproject.service.inquery;

import java.util.List;

import com.example.finalproject.model.inquery.dto.InqueryDTO;

public interface InqueryService {
		// 리스트
		public List<InqueryDTO> list() throws Exception;
		// 전체 데이터 개수
		public int getTotalRow() throws Exception;
		// 질문하기
		public int question(InqueryDTO dto) throws Exception;
		// 질문답변 보기
		public InqueryDTO view(int no, int inc) throws Exception;
		// 답변하기
		public int answer(InqueryDTO dto) throws Exception;
		// 수정하기
		public int update(InqueryDTO dto) throws Exception;
		// 삭제하기
		public int delete(int no) throws Exception;
}
