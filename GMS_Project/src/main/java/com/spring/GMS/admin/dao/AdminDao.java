package com.spring.GMS.admin.dao;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.ArtistDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ShopDto;

public interface AdminDao {

	public List<MemberDto> userList(Map<String, Object> searchInfo) throws Exception;
	public List<ArtistDto> allartistList(Map<String, Object> searchInfo) throws Exception;
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllartistCount(Map<String, String> searchCountInfo) throws Exception;
	public void addcategory(AdminDto adminDto);
	public void artistadd(ArtistDto artistDto);
	public void addart(AdminDto adminDto);
	public List<AdminDto> seleteAllCategory();
	public List<ArtistDto> seleteAllArtist();
	public List<AdminDto> seleteAllArt();
	public List<AdminDto> selectStatusList(String artStatus);
	public void Infodelete(int artArtnum);
	public void deleteArtist(int artistId);
	public AdminDto artArtnumselect(String artArtnum);
	public AdminDto selectartTitle(String artTitle);
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	public List<ShopDto> getSearchOrder(Map<String, Object> searchInfo) throws Exception;
	public List<AdminDto> getSearchart(Map<String, Object> searchInfo) throws Exception;
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllOrderCount(Map<String, String> searchCountInfo) throws Exception;
	public int getAllArtCount(Map<String, String> searchCountInfo) throws Exception;
	public List<MemberDto> userList();
	public void updateInfo(Map<String,Object> goodsMap) throws Exception;
	public void updateDeliveryState(Map<String, String> deliveryMap) throws Exception;
	public Map<String,Object> selectOrderDetail(int orderId) throws Exception;
}
