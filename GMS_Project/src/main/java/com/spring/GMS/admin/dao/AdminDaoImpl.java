package com.spring.GMS.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDto> userList(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.userList" , searchInfo);
	}
	
	@Override
	public int getAlluserCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("adminMapper.getAlluserCount" , searchCountInfo);
	}

	@Override
	public void addcategory(AdminDto adminDto) {
		sqlSession.insert("adminMapper.categoryadd" , adminDto);
	}

	@Override
	public List<AdminDto> seleteAllCategory() {
		return sqlSession.selectList("adminMapper.listCategory");
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
	public void addart(AdminDto adminDto) {
		sqlSession.insert("adminMapper.artadd" , adminDto);
	}

	@Override
	public List<AdminDto> seleteAllArt() {
		return sqlSession.selectList("adminMapper.listArt");
	}

	@Override
	public AdminDto artArtnumselect(String artArtnum) {
		return sqlSession.selectOne("adminMapper.artArtnumselect" , artArtnum);
	}
	@Override
	public AdminDto showNameselect(String artImage) {
		return sqlSession.selectOne("adminMapper.showNameselect" , artImage);
	}

	@Override
	public List<AdminDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("adminMapper.getSearchBoard" , searchInfo);
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
	
	
}
