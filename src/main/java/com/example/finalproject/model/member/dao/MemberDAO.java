package com.example.finalproject.model.member.dao;

import java.util.List;


import com.example.finalproject.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public List<MemberDTO> list();
	public void insertMember(MemberDTO dto);
	public boolean checkPw(String userid, String passwd);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
	public String find_id(String name, String email) throws Exception; //아이디 찾기
	public String find_pw(String name, String userid, String email);
	public int idCheck(String userid) throws Exception;
	public int emailCheck(String email);
	public void insertKakaoMember(MemberDTO dto);
}
