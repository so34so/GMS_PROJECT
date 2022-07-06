package com.spring.GMS.admin.dao;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

public interface AdminDao {

	public List<MemberDto> userList(Map<String, Object> searchInfo) throws Exception;
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception;
	public void addcategory(AdminDto adminDto);
	public void addart(AdminDto adminDto);
	public List<AdminDto> seleteAllCategory();
	public List<AdminDto> seleteAllArt();
	public List<AdminDto> selectStatusList(String artStatus);
	public void Infodelete(int artArtnum);
	public AdminDto artArtnumselect(String artArtnum);
	public AdminDto showNameselect(String artImage);
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception;
	public List<MemberDto> userList();
	public void updateInfo(Map<String,Object> goodsMap) throws Exception;
}
