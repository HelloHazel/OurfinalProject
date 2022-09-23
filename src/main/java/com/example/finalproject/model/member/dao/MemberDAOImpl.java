package com.example.finalproject.model.member.dao;

import java.util.List;

import com.example.finalproject.model.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public boolean loginCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return null;
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

}
