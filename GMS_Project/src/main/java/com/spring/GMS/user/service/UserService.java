package com.spring.GMS.user.service;

import com.spring.GMS.dto.MemberDto;

public interface UserService {

	public MemberDto showOneMember(String galleryId) throws Exception;
	public boolean modifyUser(MemberDto memberDto) throws Exception;
	public boolean deleteUser(MemberDto memberDto) throws Exception;
}
