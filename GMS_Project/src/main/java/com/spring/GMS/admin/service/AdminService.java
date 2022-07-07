package com.spring.GMS.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

public interface AdminService {

	public List<MemberDto> allUserList(Map<String, Object> searchInfo) throws Exception;
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception;
	public void categoryadd(AdminDto adminDto);
	public void artadd(AdminDto adminDto);
	public AdminDto selectartArtnum(String artArtnum);
	public AdminDto selectshowName(String artImage);
	public List<AdminDto> listCategory();
	public List<AdminDto> listArt();
	public List<AdminDto> listStatus(String artStatus) throws Exception;
	public void deleteInfo(int artArtnum);
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	public List<AdminDto> getSearchart(Map<String, Object> searchInfo) throws Exception;
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllArtCount(Map<String, String> searchCountInfo) throws Exception;
	public List<MemberDto> userList();
	public void modifyInfo(Map<String,Object> goodsMap) throws Exception;
}
