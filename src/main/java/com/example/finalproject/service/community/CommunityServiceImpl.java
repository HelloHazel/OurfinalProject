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
	public List<CommunityDTO> listPost() {
		return communityDao.listPost();
	}

	@Override
	public void create(CommunityDTO dto) {
		// TODO Auto-generated method stub

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

}
