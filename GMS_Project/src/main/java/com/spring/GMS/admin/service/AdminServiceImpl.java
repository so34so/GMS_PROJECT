package com.spring.GMS.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.GMS.admin.dao.AdminDao;
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
	public void categoryadd(MemberDto memberDto) {
		adminDao.addcategory(memberDto);
	}

	@Override
	public List<MemberDto> listCategory() {
		return adminDao.seleteAllCategory();
	}
	
}
