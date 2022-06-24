package com.spring.GMS.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.MemberDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectOneMember(String galleryId) throws Exception {
		return sqlSession.selectOne("userMapper.showOneMember" , galleryId);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		sqlSession.update("userMapper.modifyUser" , memberDto);
	}

	@Override
	public void removeMember(MemberDto memberDto) throws Exception {
		sqlSession.delete("userMapper.deleteUser" , memberDto);
	}
}
