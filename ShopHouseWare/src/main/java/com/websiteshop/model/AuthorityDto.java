package com.websiteshop.model;

import java.io.Serializable;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuthorityDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Account account;
	private Role role;
	private Boolean isEdit;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
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