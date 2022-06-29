package com.spring.GMS.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public void addcategory(MemberDto memberDto) {
		sqlSession.insert("adminMapper.categoryadd" , memberDto);
	}

	@Override
	public List<MemberDto> seleteAllCategory() {
		return sqlSession.selectList("adminMapper.listCategory");
	}
	
	
}
