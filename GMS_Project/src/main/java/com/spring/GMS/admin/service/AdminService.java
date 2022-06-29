package com.spring.GMS.admin.service;

import java.util.List;

import com.spring.GMS.dto.MemberDto;

public interface AdminService {

	public List<MemberDto> allUserList();
	public void categoryadd(MemberDto memberDto);
	public List<MemberDto> listCategory();
}
