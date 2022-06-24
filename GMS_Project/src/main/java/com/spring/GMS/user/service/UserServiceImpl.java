package com.spring.GMS.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.member.dao.MemberDao;
import com.spring.GMS.user.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberDto showOneMember(String galleryId) throws Exception {
		return userDao.selectOneMember(galleryId);
	}

	@Override
	public boolean modifyUser(MemberDto memberDto) throws Exception {
		
		
		boolean isUpdate = false;

		MemberDto dbMemberDto = memberDao.login(memberDto);
		
		if(passwordEncoder.matches(memberDto.getGalleryPassword(), dbMemberDto.getGalleryPassword())) {
			userDao.updateMember(memberDto);
			isUpdate = true;
		}
		
		return isUpdate;
	}

	@Override
	public boolean deleteUser(MemberDto memberDto) throws Exception {
		MemberDto dbMemberDto = memberDao.login(memberDto);
		
		boolean isDelete = false;
		
		if(passwordEncoder.matches(memberDto.getGalleryPassword(), dbMemberDto.getGalleryPassword())) {
			userDao.removeMember(memberDto);
			isDelete = true;
		}
		
		return isDelete;
	}
}
