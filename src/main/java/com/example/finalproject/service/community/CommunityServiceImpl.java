package com.example.finalproject.service.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.example.finalproject.model.community.dao.CommunityDAO;
import com.example.finalproject.model.community.dto.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	CommunityDAO communityDao;
	
	@Override
	public List<CommunityDTO> listPost(int start, int end) {
		return communityDao.listPost(start,end);
	}
	
	@Override
	public void create(CommunityDTO dto) throws Exception{
		communityDao.create(dto);
	}

	@Override
	public void update(CommunityDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int comm_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int comm_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int comm_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void increaseViewcnt(int comm_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public CommunityDTO detailPost(int comm_no) {
		return communityDao.detailPost(comm_no);
	}

	@Override
	public int countArticle() {
		return communityDao.countArticle();
	}

	

}
