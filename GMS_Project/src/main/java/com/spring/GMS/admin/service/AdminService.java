package com.spring.GMS.admin.service;

import java.util.List;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

public interface AdminService {

	public List<MemberDto> allUserList();
	public void categoryadd(AdminDto adminDto);
	public List<AdminDto> listCategory();
	public List<AdminDto> listStatus(String artStatus) throws Exception;
	public void deleteFile(String mainArt);
}
