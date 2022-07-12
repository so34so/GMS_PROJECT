package com.spring.GMS.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.GMS.admin.dao.AdminDao;
import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.ArtistDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ShopDto;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<MemberDto> allUserList(Map<String, Object> searchInfo) throws Exception {
		return adminDao.userList(searchInfo);
	}
	
	@Override
	public List<ArtistDto> allartistList(Map<String, Object> searchInfo) throws Exception {
		return adminDao.allartistList(searchInfo);
	}

	@Override
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception {
		return adminDao.getAlluserCount(searchCountInfo);
	}
	
	@Override
	public int getAllartistCount(Map<String, String> searchCountInfo) throws Exception {
		return adminDao.getAllartistCount(searchCountInfo);
	}
	
	@Override
	public void categoryadd(AdminDto adminDto) {
		adminDao.addcategory(adminDto);
	}
	
	@Override
	public void artistadd(ArtistDto artistDto) {
		adminDao.artistadd(artistDto);
	}

	@Override
	public List<AdminDto> listCategory() {
		return adminDao.seleteAllCategory();
	}
	@Override
	public List<ArtistDto> listArtist() {
		return adminDao.seleteAllArtist();
	}

	@Override
	public List<AdminDto> listStatus(String artStatus) throws Exception {
		return adminDao.selectStatusList(artStatus);
	}

	@Override
	public void deleteInfo(int artArtnum) {
		adminDao.Infodelete(artArtnum);
	}

	@Override
	public void artadd(AdminDto adminDto) {
		adminDao.addart(adminDto);
	}

	@Override
	public List<AdminDto> listArt() {
		return adminDao.seleteAllArt();
	}

	@Override
	public AdminDto selectartArtnum(String artArtnum) {
		return adminDao.artArtnumselect(artArtnum);
	}
	
	@Override
	public AdminDto selectartTitle(String artTitle) {
		return adminDao.selectartTitle(artTitle);
	}

	@Override
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		return adminDao.getSearchBoard(searchInfo);
	}
	
	@Override
	public List<ShopDto> getSearchOrder(Map<String, Object> searchInfo) throws Exception {
		return adminDao.getSearchOrder(searchInfo);
	}
	
	@Override
	public List<AdminDto> getSearchart(Map<String, Object> searchInfo) throws Exception {
		return adminDao.getSearchart(searchInfo);
	}

	@Override
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception {
		return adminDao.getAllBoardCount(searchCountInfo);
	}
	
	@Override
	public int getAllOrderCount(Map<String, String> searchCountInfo) throws Exception {
		return adminDao.getAllOrderCount(searchCountInfo);
	}
	
	@Override
	public int getAllArtCount(Map<String, String> searchCountInfo) throws Exception {
		return adminDao.getAllArtCount(searchCountInfo);
	}

	@Override
	public List<MemberDto> userList() {
		return adminDao.userList();
	}

	@Override
	public void modifyInfo(Map<String, Object> goodsMap) throws Exception {
		adminDao.updateInfo(goodsMap);
	}
	
	@Override
	public void modifyDeliveryState(Map<String, String> deliveryMap) throws Exception{
		adminDao.updateDeliveryState(deliveryMap);
	}
	
	@Override
	public Map<String,Object> orderDetail(int orderId) throws Exception{
		return adminDao.selectOrderDetail(orderId);
	}

	@Override
	public void deleteArtist(int artistId) {
		adminDao.deleteArtist(artistId);
	}
}
