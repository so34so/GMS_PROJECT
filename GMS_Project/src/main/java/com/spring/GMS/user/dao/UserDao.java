package com.spring.GMS.user.dao;

import com.spring.GMS.dto.MemberDto;

public interface UserDao {

	public MemberDto selectOneMember(String galleryId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void removeMember(MemberDto memberDto) throws Exception;
}
