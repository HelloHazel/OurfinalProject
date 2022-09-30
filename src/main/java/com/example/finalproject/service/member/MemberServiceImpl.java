package com.example.finalproject.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.member.dao.MemberDAO;
import com.example.finalproject.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDao.loginCheck(dto);
		if(result) {
			//로그인 성공시
			//세션변수에 값 저장
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("name", dto2.getName());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		//세션 초기화
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}

	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		return memberDao.checkPw(userid, passwd);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
	}

	@Override
	public void deleteMember(String userid) {
		memberDao.deleteMember(userid);
	}

	@Override
	public String find_id(HttpServletResponse response, String name, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = memberDao.find_id(name, email);
		
		if (userid == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userid;
		}
	}

	@Override
	public Object find_pw(HttpServletResponse response, String name, String userid, String email) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String passwd = memberDao.find_pw(name, userid, email);
		
		if (passwd == null) {
			out.println("<script>");
			out.println("alert('일치하는 정보가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return passwd;
		}
	}

	@Override
	public int idCheck(String userid) throws Exception {
		int result = memberDao.idCheck(userid);
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = memberDao.emailCheck(email);
		return result;
	}

	

}
