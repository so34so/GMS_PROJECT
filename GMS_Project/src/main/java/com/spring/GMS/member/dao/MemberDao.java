package com.spring.GMS.member.dao;

import com.spring.GMS.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto) throws Exception ;
	public MemberDto overlapped(String galleryId) throws Exception ;
	public MemberDto nameCheck(String galleryNickname) throws Exception ;

}
