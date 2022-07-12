package com.spring.GMS.user.service;

import java.util.Map;

import com.spring.GMS.dto.MemberDto;
import com.spring.GMS.dto.ReviewDto;

public interface UserService {

	public MemberDto showOneMember(String galleryId) throws Exception;
	public boolean modifyUser(MemberDto memberDto) throws Exception;
	public boolean deleteUser(MemberDto memberDto) throws Exception;
	public void reviewadd(ReviewDto reviewDto) throws Exception;
	public boolean getSearchReview(Map<String, Object> haveReview) throws Exception;
	public ReviewDto getOneReview(Map<String, Object> haveReview) throws Exception;
	public void deleteReview(Map<String, Object> haveReview) throws Exception;
}
