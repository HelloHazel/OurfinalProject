package com.example.finalproject.service.mypage;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.mypage.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	MyPageDAO mypageDao;
}
