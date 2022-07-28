package com.spring.GMS.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminDto {
	
	private String artTitle;
	private String artContent;
	private String artStatus;
	private int artArtnum;
	private String artist;
	private String showName;
	private Date startDate;
	private Date endDate;
	private String mainArt;
	private String artImage;
	private int artPrice;
	private int deliveryPrice;
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public String getArtContent() {
		return artContent;
	}
	public void setArtContent(String artContent) {
		this.artContent = artContent;
	}
	public String getArtStatus() {
		return artStatus;
	}
	public void setArtStatus(String artStatus) {
		this.artStatus = artStatus;
	}
	public int getArtArtnum() {
		return artArtnum;
	}
	public void setArtArtnum(int artArtnum) {
		this.artArtnum = artArtnum;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getMainArt() {
		return mainArt;
	}
	public void setMainArt(String mainArt) {
		this.mainArt = mainArt;
	}
	public String getArtImage() {
		return artImage;
	}
	public void setArtImage(String artImage) {
		this.artImage = artImage;
	}
	public int getArtPrice() {
		return artPrice;
	}
	public void setArtPrice(int artPrice) {
		this.artPrice = artPrice;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	
	
}
