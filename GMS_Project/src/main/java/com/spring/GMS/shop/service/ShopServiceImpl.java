package com.spring.GMS.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.GMS.dto.AdminDto;
import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;
import com.spring.GMS.shop.dao.ShopDao;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;

	@Override
	public MemberDto getOrderInfo(String galleryId) {
		return shopDao.selectOrderinfo(galleryId);
	}

	@Override
	public void addNewOrder(ShopDto shopDto) throws Exception {
		shopDao.insertOrder(shopDto);
	}

	@Override
	public List<ReviewDto> selectreview(String artTitle) throws Exception {
		return shopDao.selectreview(artTitle);
	}
	
	@Override
	public int getAllReviewCount(Map<String, String> searchCountInfo) throws Exception {
		return shopDao.getAllReviewCount(searchCountInfo);
	}
	
}
