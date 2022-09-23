package com.example.finalproject.model.mypage.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	SqlSession sqlSession;
}
