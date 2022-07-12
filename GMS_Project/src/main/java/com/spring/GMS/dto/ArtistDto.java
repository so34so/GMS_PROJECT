package com.spring.GMS.dto;

public class ArtistDto {
	
	private int artistId;
	private String artist;
	private String artistImage;
	private String artistComent;
	private String mainArtist;
	public int getArtistId() {
		return artistId;
	}
	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getArtistImage() {
		return artistImage;
	}
	public void setArtistImage(String artistImage) {
		this.artistImage = artistImage;
	}
	public String getArtistComent() {
		return artistComent;
	}
	public void setArtistComent(String artistComent) {
		this.artistComent = artistComent;
	}
	public String getMainArtist() {
		return mainArtist;
	}
	public void setMainArtist(String mainArtist) {
		this.mainArtist = mainArtist;
	}
	
}
