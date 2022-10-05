package com.example.finalproject.service.community;

import java.util.List;

import com.example.finalproject.model.community.dto.CommunityDTO;

public interface CommunityService {
	
	public List<CommunityDTO> listPost(int start, int end);//목록
	public void create(CommunityDTO dto) throws Exception; //글쓰기 
	public void update(CommunityDTO dto) throws Exception; //글수정
	public void delete(int comm_no) throws Exception; //글삭제
	public void deleteFile(String fullName); //첨부파일 삭제
	public String getAttach(int comm_no); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullName, int comm_no);//첨부파일 수정
	public void increaseViewcnt(int comm_no) throws Exception;//조회수 증가 처리
	public CommunityDTO detailPost(int comm_no);
	public int countArticle();
	/**
	 * 마이페이지 - 나의 게시글 내역 조회
	 * @param userId
	 * @return
	 */
	public List<CommunityDTO> myCmmList(String userId);
	
}
