package com.spring.GMS.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;

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

	@Override
	public void reviewadd(ReviewDto reviewDto) throws Exception {
		sqlSession.insert("userMapper.reviewadd" , reviewDto);
	}

	@Override
	public ReviewDto getSearchReview(Map<String, Object> haveReview) throws Exception {
		return sqlSession.selectOne("userMapper.getSearchReview" , haveReview);
	}

	@Override
	public void deleteReview(Map<String, Object> haveReview) throws Exception {
		sqlSession.delete("userMapper.deleteReview" , haveReview);
	}
}
