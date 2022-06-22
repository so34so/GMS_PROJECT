package com.spring.GMS.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberDto memberDto) throws Exception {
		sqlSession.insert("gmsMapper.registerMember", memberDto);
	}

	@Override
	public MemberDto overlapped(String galleryId) throws Exception {
		return sqlSession.selectOne("gmsMapper.userCheck" , galleryId);
	}

	@Override
	public MemberDto nameCheck(String galleryNickname) throws Exception {
		return sqlSession.selectOne("gmsMapper.nameCheck" , galleryNickname);
	}

	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		return sqlSession.selectOne("gmsMapper.loginMember" , memberDto);
	}

	@Override
	public MemberDto selectOneMember(String galleryId) throws Exception {
		return sqlSession.selectOne("gmsMapper.showOneMember" , galleryId);
	}
	
	
	
}
