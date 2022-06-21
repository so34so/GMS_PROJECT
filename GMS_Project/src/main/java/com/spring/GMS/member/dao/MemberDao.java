package com.spring.GMS.member.dao;

import com.spring.GMS.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto);
	public MemberDto overlapped(String galleryId);
	public MemberDto nameCheck(String galleryNickname);

}
