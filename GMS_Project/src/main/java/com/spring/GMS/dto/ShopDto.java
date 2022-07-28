package com.spring.GMS.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ShopDto {
	
	private int orderId;
	private String galleryId;
	private int artArtnum;
	private String artTitle;
	private int artPrice;
	private String galleryEmail;
	private String galleryName;
	private String receiverName;
	private String deliveryAddress;
	private String deliveryMethod;
	private String deliveryMessage;
	private Date payOrderTime;
	private String cardComName;
	private String cardPayMonth;
	private String deliveryState;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getGalleryId() {
		return galleryId;
	}
	public void setGalleryId(String galleryId) {
		this.galleryId = galleryId;
	}
	public int getArtArtnum() {
		return artArtnum;
	}
	public void setArtArtnum(int artArtnum) {
		this.artArtnum = artArtnum;
	}
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public int getArtPrice() {
		return artPrice;
	}
	public void setArtPrice(int artPrice) {
		this.artPrice = artPrice;
	}
	public String getGalleryName() {
		return galleryName;
	}
	public void setGalleryName(String galleryName) {
		this.galleryName = galleryName;
	}
	public String getGalleryEmail() {
		return galleryEmail;
	}
	public void setGalleryEmail(String galleryEmail) {
		this.galleryEmail = galleryEmail;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getDeliveryMessage() {
		return deliveryMessage;
	}
	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}
	public Date getPayOrderTime() {
		return payOrderTime;
	}
	public void setPayOrderTime(Date payOrderTime) {
		this.payOrderTime = payOrderTime;
	}
	public String getCardComName() {
		return cardComName;
	}
	public void setCardComName(String cardComName) {
		this.cardComName = cardComName;
	}
	public String getCardPayMonth() {
		return cardPayMonth;
	}
	public void setCardPayMonth(String cardPayMonth) {
		this.cardPayMonth = cardPayMonth;
	}
	public String getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}
	
	
}
