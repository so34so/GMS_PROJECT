package com.spring.GMS.admin.dao;

import java.util.List;

import com.spring.GMS.dto.MemberDto;

public interface AdminDao {

	public List<MemberDto> userList();
	public void addcategory(MemberDto memberDto);
	public List<MemberDto> seleteAllCategory();
}
