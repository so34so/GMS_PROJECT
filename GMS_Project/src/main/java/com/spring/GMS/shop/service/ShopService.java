package com.spring.GMS.shop.service;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;

public interface ShopService {

	public MemberDto getOrderInfo(String galleryId);
	public void addNewOrder(ShopDto shopDto) throws Exception;
	public List<ReviewDto> selectreview(String artTitle) throws Exception;
	public List<ReviewDto> getreviewChart(Map<String, Object> searchInfo) throws Exception;
	public int getAllReviewCount(Map<String, String> searchCountInfo) throws Exception;
}
