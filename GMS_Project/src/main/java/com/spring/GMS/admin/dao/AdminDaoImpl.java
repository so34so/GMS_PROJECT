package com.spring.GMS.admin.dao;

import java.util.List;

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
	public List<MemberDto> userList() {
		return sqlSession.selectList("adminMapper.allUserList");
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
	public void fileDelete(String mainArt) {
		sqlSession.delete("adminmapper.deleteFile" , mainArt);
	}
	
	
}
