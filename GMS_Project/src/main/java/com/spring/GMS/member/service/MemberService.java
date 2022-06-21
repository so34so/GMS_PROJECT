package com.spring.GMS.member.service;

import com.spring.GMS.dto.MemberDto;

public interface MemberService {

	public void registerMember(MemberDto memberDto);
	public String overlapped(String galleryId);
	public String nameCheck(String galleryNickname);
}
