package com.example.finalproject.service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.finalproject.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto,HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String userid);
	public List<MemberDTO> list();
	public void insertMember(MemberDTO dto);
	public boolean checkPw(String userid, String passwd);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
	public String find_id(HttpServletResponse response,String name, String email) throws  Exception; //아이디 찾기
	public Object find_pw(HttpServletResponse response, String name, String userid, String email) throws IOException;
	public int idCheck(String userid) throws Exception;
	public int emailCheck(String email);
}
