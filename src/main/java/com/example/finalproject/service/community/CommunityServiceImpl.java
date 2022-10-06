package com.example.finalproject.service.community;

import java.util.List;

import javax.inject.Inject;

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
		communityDao.update(dto);
	}

	@Override
	public void delete(int comm_no) {
		communityDao.delete(comm_no);
	}

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getAttach(int comm_no) {
		return communityDao.getAttach(comm_no);
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

	@Override
	public List<CommunityDTO> myCmmList(String userId) {
		return communityDao.myCmmList(userId);
	}

	
	

}
