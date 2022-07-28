package com.spring.GMS.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.ArtistDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ShopDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDto> userList(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.userList" , searchInfo);
	}
	
	@Override
	public List<ArtistDto> allartistList(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.artistList" , searchInfo);
	}
	
	@Override
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAlluserCount" , searchCountInfo);
	}
	
	@Override
	public int getAllartistCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAllartistCount" , searchCountInfo);
	}

	@Override
	public void addcategory(AdminDto adminDto) {
		sqlSession.insert("adminMapper.categoryadd" , adminDto);
	}
	
	@Override
	public void artistadd(ArtistDto artistDto) {
		sqlSession.insert("adminMapper.artistadd" , artistDto);
	}

	@Override
	public List<AdminDto> seleteAllCategory() {
		return sqlSession.selectList("adminMapper.listCategory");
	}
	
	@Override
	public List<ArtistDto> seleteAllArtist() {
		return sqlSession.selectList("adminMapper.listArtist");
	}

	@Override
	public List<AdminDto> selectStatusList(String artStatus) {
		return sqlSession.selectList("adminMapper.selectStatusList" , artStatus);
	}

	@Override
	public void Infodelete(int artArtnum) {
		sqlSession.delete("adminMapper.deleteInfo" , artArtnum);
	}

	@Override
	public AdminDto artArtnumselect(String artArtnum) {
		return sqlSession.selectOne("adminMapper.artArtnumselect" , artArtnum);
	}
	@Override
	public AdminDto selectartTitle(String artTitle) {
		return sqlSession.selectOne("adminMapper.selectartTitle" , artTitle);
	}

	@Override
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.getSearchBoard" , searchInfo);
	}
	
	@Override
	public List<ShopDto> getSearchOrder(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.getSearchOrder" , searchInfo);
	}
	
	@Override
	public List<AdminDto> getSearchart(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.getSearchArt" , searchInfo);
	}

	@Override
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAllBoardCount" , searchCountInfo);
	}
	
	@Override
	public int getAllOrderCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAllOrderCount" , searchCountInfo);
	}
	
	@Override
	public int getAllArtCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAllArtCount" , searchCountInfo);
	}

	@Override
	public List<MemberDto> userList() {
		return sqlSession.selectList("adminMapper.AlluserList");
	}

	@Override
	public void updateInfo(Map<String, Object> goodsMap) throws Exception {
		sqlSession.update("adminMapper.updateInfo" , goodsMap);
	}
	
	public void  updateDeliveryState(Map<String, String> deliveryMap) throws Exception{
		sqlSession.update("adminMapper.updateDeliveryState" , deliveryMap);
	}
	
	public Map<String,Object> selectOrderDetail(int orderId) throws Exception{
		return sqlSession.selectOne("adminMapper.selectOrderDetail" , orderId);
	}

	@Override
	public void deleteArtist(int artistId) {
		sqlSession.delete("adminMapper.deleteArtist" , artistId);
	}
}
