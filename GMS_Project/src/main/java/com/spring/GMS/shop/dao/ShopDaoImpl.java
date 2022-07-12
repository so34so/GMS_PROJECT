package com.spring.GMS.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectOrderinfo(String galleryId) {
		return sqlSession.selectOne("shopMapper.getOrderInfo" , galleryId);
	}

	@Override
	public void insertOrder(ShopDto shopDto) {
		sqlSession.insert("shopMapper.insertOrder" , shopDto);
	}

	@Override
	public List<ReviewDto> selectreview(String artTitle) {
		return sqlSession.selectList("shopMapper.reviewList" , artTitle);
	}

	@Override
	public List<ReviewDto> getreviewChart(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("shopMapper.getreviewChart" , searchInfo);
	}

	@Override
	public int getAllReviewCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("shopMapper.getAllReviewCount" , searchCountInfo);
	}
	
}
