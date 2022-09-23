package com.example.finalproject.model.admin;

import com.example.finalproject.model.member.dto.MemberDTO;

public interface AdminDAO {
	// 따로 AdminDTO를 만들지 않고 멤버변수 이름이 같은 MemberDTO 재활용
		public String loginCheck(MemberDTO dto);
}
