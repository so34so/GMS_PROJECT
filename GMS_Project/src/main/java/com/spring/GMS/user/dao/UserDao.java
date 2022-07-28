package com.spring.GMS.user.dao;

import java.util.List;
import java.util.Map;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;
import com.spring.GMS.dto.ShopDto;

public interface UserDao {

	public void updateMember(MemberDto memberDto) throws Exception;
	public void removeMember(MemberDto memberDto) throws Exception;
	public void reviewadd(ReviewDto reviewDto) throws Exception;
	public ReviewDto getSearchReview(Map<String, Object> haveReview) throws Exception;
	public void deleteReview(Map<String, Object> haveReview) throws Exception;
	public List<ReviewDto> showReviewList(String galleryId) throws Exception;
	public List<ShopDto> showOrderList(String galleryId) throws Exception;
}
