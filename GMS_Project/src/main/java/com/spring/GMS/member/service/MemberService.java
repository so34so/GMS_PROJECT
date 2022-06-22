package com.spring.GMS.member.service;

import com.spring.GMS.dto.MemberDto;

public interface MemberService {

	public void registerMember(MemberDto memberDto) throws Exception;
	public String overlapped(String galleryId) throws Exception;
	public String nameCheck(String galleryNickname) throws Exception;
	public MemberDto loginMember(MemberDto memberDto) throws Exception;
	public MemberDto showOneMember(String galleryId) throws Exception;
}
