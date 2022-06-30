package com.spring.GMS.admin.dao;

import java.util.List;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

public interface AdminDao {

	public List<MemberDto> userList();
	public void addcategory(AdminDto adminDto);
	public List<AdminDto> seleteAllCategory();
	public List<AdminDto> selectStatusList(String artStatus);
	public void fileDelete(String mainArt);
}
