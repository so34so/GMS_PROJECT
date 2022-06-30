package com.spring.GMS.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberDto {
	
	private String galleryId;
	private String galleryName;
	private String galleryPassword;
	private String galleryNickname;
	private String galleryEmail;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String zipcode;
	private Date joinDate;
	public String getGalleryId() {
		return galleryId;
	}
	public void setGalleryId(String galleryId) {
		this.galleryId = galleryId;
	}
	public String getGalleryName() {
		return galleryName;
	}
	public void setGalleryName(String galleryName) {
		this.galleryName = galleryName;
	}
	public String getGalleryPassword() {
		return galleryPassword;
	}
	public void setGalleryPassword(String galleryPassword) {
		this.galleryPassword = galleryPassword;
	}
	public String getGalleryNickname() {
		return galleryNickname;
	}
	public void setGalleryNickname(String galleryNickname) {
		this.galleryNickname = galleryNickname;
	}
	public String getGalleryEmail() {
		return galleryEmail;
	}
	public void setGalleryEmail(String galleryEmail) {
		this.galleryEmail = galleryEmail;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
}
