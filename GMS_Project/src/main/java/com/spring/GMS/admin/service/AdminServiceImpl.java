package com.spring.GMS.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.GMS.admin.dao.AdminDao;
import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<MemberDto> allUserList() {
		return adminDao.userList();
	}

	@Override
	public void categoryadd(AdminDto adminDto) {
		adminDao.addcategory(adminDto);
	}

	@Override
	public List<AdminDto> listCategory() {
		return adminDao.seleteAllCategory();
	}

	@Override
	public List<AdminDto> listStatus(String artStatus) throws Exception {
		return adminDao.selectStatusList(artStatus);
	}

	@Override
	public void deleteFile(String mainArt) {
		adminDao.fileDelete(mainArt);
	}
	
}
