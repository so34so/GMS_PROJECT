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
	private String artTitle;
	private String artContent;
	private int artSell;
	private String artStatus;
	private int artArtnum;
	private Date comentDate;
	private String comentTitle;
	private String comentContent;
	private String comentBest;
	private int comentBestNum;
	private String comentWorst;
	private int comentWorstNum;
	private String artist;
	private String artistArt;
	private String artistComent;
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
	public Date getComentDate() {
		return comentDate;
	}
	public void setComentDate(Date comentDate) {
		this.comentDate = comentDate;
	}
	public String getComentTitle() {
		return comentTitle;
	}
	public void setComentTitle(String comentTitle) {
		this.comentTitle = comentTitle;
	}
	public String getComentContent() {
		return comentContent;
	}
	public void setComentContent(String comentContent) {
		this.comentContent = comentContent;
	}
	public String getComentBest() {
		return comentBest;
	}
	public void setComentBest(String comentBest) {
		this.comentBest = comentBest;
	}
	public int getComentBestNum() {
		return comentBestNum;
	}
	public void setComentBestNum(int comentBestNum) {
		this.comentBestNum = comentBestNum;
	}
	public String getComentWorst() {
		return comentWorst;
	}
	public void setComentWorst(String comentWorst) {
		this.comentWorst = comentWorst;
	}
	public int getComentWorstNum() {
		return comentWorstNum;
	}
	public void setComentWorstNum(int comentWorstNum) {
		this.comentWorstNum = comentWorstNum;
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
	
	@Override
	public String toString() {
		return "MemberDto [galleryId=" + galleryId + ", galleryName=" + galleryName + ", galleryPassword="
				+ galleryPassword + ", galleryNickname=" + galleryNickname + ", galleryEmail=" + galleryEmail
				+ ", artTitle=" + artTitle + ", artContent=" + artContent + ", artSell=" + artSell + ", artStatus="
				+ artStatus + ", artArtnum=" + artArtnum + ", comentDate=" + comentDate + ", comentTitle=" + comentTitle
				+ ", comentContent=" + comentContent + ", comentBest=" + comentBest + ", comentBestNum=" + comentBestNum
				+ ", comentWorst=" + comentWorst + ", comentWorstNum=" + comentWorstNum + ", artist=" + artist
				+ ", artistArt=" + artistArt + ", artistComent=" + artistComent + "]";
	}
	
	
	

	
	
}
