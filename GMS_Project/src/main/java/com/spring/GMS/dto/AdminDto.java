package com.spring.GMS.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminDto {
	
	private String artTitle;
	private String artContent;
	private int artSell;
	private String artStatus;
	private int artArtnum;
	private String artist;
	private String artistArt;
	private String artistComent;
	private String showName;
	private Date startDate;
	private Date endDate;
	private String mainArt;
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
	public int getArtSell() {
		return artSell;
	}
	public void setArtSell(int artSell) {
		this.artSell = artSell;
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
	public String getArtistArt() {
		return artistArt;
	}
	public void setArtistArt(String artistArt) {
		this.artistArt = artistArt;
	}
	public String getArtistComent() {
		return artistComent;
	}
	public void setArtistComent(String artistComent) {
		this.artistComent = artistComent;
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
	
	
}