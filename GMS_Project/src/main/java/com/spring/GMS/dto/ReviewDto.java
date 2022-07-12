package com.spring.GMS.dto;

import java.util.Date;

public class ReviewDto {

	private String artTitle;
	private String galleryId;
	private String galleryNickname;
	private Date reviewDate;
	private String reviewTitle;
	private String reviewContent;
	private String reviewRate;
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public String getGalleryId() {
		return galleryId;
	}
	public void setGalleryId(String galleryId) {
		this.galleryId = galleryId;
	}
	public String getGalleryNickname() {
		return galleryNickname;
	}
	public void setGalleryNickname(String galleryNickname) {
		this.galleryNickname = galleryNickname;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(String reviewRate) {
		this.reviewRate = reviewRate;
	}
	
	
}
