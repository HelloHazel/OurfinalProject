package com.example.finalproject.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.login_check",dto);
		//조건식 ? true일때 값 : false일때 값
		return (name==null) ? false : true;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember",userid);
	}

	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String find_id(String name, String email) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email",email);
		return sqlSession.selectOne("member.findId", map);
	}

	@Override
	public String find_pw(String name, String userid, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("userid",userid);
		map.put("email",email);
		return sqlSession.selectOne("member.findPw", map);
	}
	
	

}
