package com.spring.GMS.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.ArtistDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ShopDto;

public interface AdminService {

	public List<MemberDto> allUserList(Map<String, Object> searchInfo) throws Exception;
	public List<ArtistDto> allartistList(Map<String, Object> searchInfo) throws Exception;
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllartistCount(Map<String, String> searchCountInfo) throws Exception;
	public void categoryadd(AdminDto adminDto);
	public void artistadd(ArtistDto artistDto);
	public AdminDto selectartArtnum(String artArtnum);
	public AdminDto selectartTitle(String artTitle);
	public List<AdminDto> listCategory();
	public List<ArtistDto> listArtist();
	public List<AdminDto> listStatus(String artStatus) throws Exception;
	public void deleteInfo(int artArtnum);
	public void deleteArtist(int artistId);
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	public List<ShopDto> getSearchOrder(Map<String, Object> searchInfo) throws Exception;
	public List<AdminDto> getSearchart(Map<String, Object> searchInfo) throws Exception;
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllOrderCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllArtCount(Map<String, String> searchCountInfo) throws Exception;
	public List<MemberDto> userList();
	public void modifyInfo(Map<String,Object> goodsMap) throws Exception;
	public void modifyDeliveryState(Map<String, String> deliveryMap) throws Exception;
	public Map<String,Object> orderDetail(int orderId) throws Exception;
	
}
