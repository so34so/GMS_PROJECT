package com.spring.GMS.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ShopDto {
	
	private Date comentDate;
	private String comentTitle;
	private String comentContent;
	private String comentBest;
	private int comentBestNum;
	private String comentWorst;
	private int comentWorstNum;
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
	
}
