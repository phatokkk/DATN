package com.websiteshop.model;

import java.io.Serializable;
import java.util.List;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long commentId;
	private Account account;
	private Product product;
	private String description;
	private Boolean isEdit;
	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getIsEdit() {
		return isEdit;
	}
	public void setIsEdit(Boolean isEdit) {
		this.isEdit = isEdit;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
