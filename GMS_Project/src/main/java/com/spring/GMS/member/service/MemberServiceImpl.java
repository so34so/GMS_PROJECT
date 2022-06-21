package com.spring.GMS.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public void registerMember(MemberDto memberDto) throws Exception  {
		memberDto.setGalleryPassword(passwordEncoder.encode(memberDto.getGalleryPassword()));
		memberDao.insertMember(memberDto);
	}

	@Override
	public String overlapped(String galleryId) throws Exception  {
		
		String isOverLapped = "true";
		
		if(memberDao.overlapped(galleryId) == null) {
			return "false";
		}
		return isOverLapped;
	}

	@Override
	public String nameCheck(String galleryNickname) throws Exception  {
		
		String isOverLapped = "true";
		
		if(memberDao.nameCheck(galleryNickname) == null) {
			return "false";
		}
		return isOverLapped;
		
	}
	
}
