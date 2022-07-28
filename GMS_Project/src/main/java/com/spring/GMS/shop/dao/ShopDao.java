package com.spring.GMS.shop.dao;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;

public interface ShopDao {

	public MemberDto selectOrderinfo(String galleryId);
	public void insertOrder(ShopDto shopDto);
	public List<ReviewDto> selectreview(String artTitle);
	public int getAllReviewCount(Map<String, String> searchCountInfo) throws Exception;
}
