package com.example.finalproject.model.notice.dao;

import java.util.List;

import com.example.finalproject.model.notice.dto.NoticeDTO;

public interface NoticeDAO {
		// 리스트
		public List<NoticeDTO> list() throws Exception;
		// 전체 데이터 개수
		public int getTotalRow() throws Exception;
		// 보기
		public NoticeDTO view(int no) throws Exception;
		// 조회수
		public void increase(int no) throws Exception;
		// 글쓰기
		public int write(NoticeDTO dto) throws Exception;
		// 수정
		public int update(NoticeDTO dto) throws Exception;
		// 삭제
		public int delete(int no) throws Exception;
}
