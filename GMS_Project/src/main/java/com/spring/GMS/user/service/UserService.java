package com.spring.GMS.user.service;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;

public interface UserService {

	public boolean modifyUser(MemberDto memberDto) throws Exception;
	public boolean deleteUser(MemberDto memberDto) throws Exception;
	public void reviewadd(ReviewDto reviewDto) throws Exception;
	public boolean getSearchReview(Map<String, Object> haveReview) throws Exception;
	public ReviewDto getOneReview(Map<String, Object> haveReview) throws Exception;
	public void deleteReview(Map<String, Object> haveReview) throws Exception;
	public List<ReviewDto> showReviewList(String galleryId) throws Exception;
	public List<ShopDto> showOrderList(String galleryId) throws Exception;
}
