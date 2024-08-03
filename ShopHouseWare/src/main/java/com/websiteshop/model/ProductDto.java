package com.websiteshop.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
public class ProductDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long productId;
	private String name;
	private int quantity;
	private int unitPrice;
	private int oldPrice;
	private String publishing;
	private String provider;
	public String author;
	private int discount;
	private MultipartFile image1File;
	private String image1;
	private String image2;
	private MultipartFile image2File;
	private String image3;
	private MultipartFile image3File;
	private String image4;
	private MultipartFile image4File;
	private String image5;
	private MultipartFile image5File;
	private String Discription;
	private String enteredDay;
	private Boolean isEdit;
	private Long categoryId;
	private String hotSale;
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(int oldPrice) {
		this.oldPrice = oldPrice;
	}
	public String getPublishing() {
		return publishing;
	}
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public MultipartFile getImage1File() {
		return image1File;
	}
	public void setImage1File(MultipartFile image1File) {
		this.image1File = image1File;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public MultipartFile getImage2File() {
		return image2File;
	}
	public void setImage2File(MultipartFile image2File) {
		this.image2File = image2File;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public MultipartFile getImage3File() {
		return image3File;
	}
	public void setImage3File(MultipartFile image3File) {
		this.image3File = image3File;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public MultipartFile getImage4File() {
		return image4File;
	}
	public void setImage4File(MultipartFile image4File) {
		this.image4File = image4File;
	}
	public String getImage5() {
		return image5;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public MultipartFile getImage5File() {
		return image5File;
	}
	public void setImage5File(MultipartFile image5File) {
		this.image5File = image5File;
	}
	public String getDiscription() {
		return Discription;
	}
	public void setDiscription(String discription) {
		Discription = discription;
	}
	public String getEnteredDay() {
		return enteredDay;
	}
	public void setEnteredDay(String enteredDay) {
		this.enteredDay = enteredDay;
	}
	public Boolean getIsEdit() {
		return isEdit;
	}
	public void setIsEdit(Boolean isEdit) {
		this.isEdit = isEdit;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getHotSale() {
		return hotSale;
	}
	public void setHotSale(String hotSale) {
		this.hotSale = hotSale;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
