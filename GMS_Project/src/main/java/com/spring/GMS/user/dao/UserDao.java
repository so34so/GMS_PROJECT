package com.spring.GMS.user.dao;

import java.util.Map;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;

public interface UserDao {

	public MemberDto selectOneMember(String galleryId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void removeMember(MemberDto memberDto) throws Exception;
	public void reviewadd(ReviewDto reviewDto) throws Exception;
	public ReviewDto getSearchReview(Map<String, Object> haveReview) throws Exception;
	public void deleteReview(Map<String, Object> haveReview) throws Exception;
}
