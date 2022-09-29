package com.example.finalproject.model.notice.dao;

import java.util.List;

import com.example.finalproject.model.notice.dto.NoticeDTO;

public interface NoticeDAO {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullName, int bno);//첨부파일 수정
	public void create(NoticeDTO dto) throws Exception; //글쓰기 
	public void update(NoticeDTO dto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<NoticeDTO> listAll(int start, int end) throws Exception;//목록
	public void increaseViewcnt(int bno) throws Exception;//조회수 증가 처리
	public int countArticle() throws Exception;//레코드 갯수 계산 
	public NoticeDTO read(int bno) throws Exception;	//레코드 조회
}
