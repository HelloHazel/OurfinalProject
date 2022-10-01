package com.example.finalproject.model.community.dao;

import java.util.List;

import com.example.finalproject.model.community.dto.CommunityDTO;

public interface CommunityDAO {
	
	public List<CommunityDTO> listPost(int start, int end);//목록
	public void create(CommunityDTO dto); //글쓰기 
	public void update(CommunityDTO dto); //글수정
	public void delete(int comm_no); //글삭제
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int comm_no); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullName, int comm_no);//첨부파일 수정
	public void increaseViewcnt(int comm_no) throws Exception;//조회수 증가 처리
	public CommunityDTO detailPost(int comm_no);
	public int countArticle();
	
}
