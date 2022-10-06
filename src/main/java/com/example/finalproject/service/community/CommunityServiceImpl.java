package com.example.finalproject.service.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public void increaseViewcnt(int comm_no, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_" + comm_no) != null) {
			//최근에 조회수를 올린 시간
			update_time=(long) session.getAttribute("update_time_"+comm_no);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간이 경화한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) { //5초     24*60*60*1000 (하루)
			communityDao.increaseViewcnt(comm_no);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+comm_no, current_time);
		}
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

	@Override
	public CommunityDTO read(int comm_no) {
		return communityDao.read(comm_no);
	}

	
	

}
