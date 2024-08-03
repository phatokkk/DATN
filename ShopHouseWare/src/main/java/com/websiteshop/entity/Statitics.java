package com.websiteshop.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Statistic") // Sửa tên bảng
@NoArgsConstructor
public class Statitics implements Serializable {

	@Id
	private Long id;

	@ManyToOne
	@JoinColumn(name = "OrderId")
	private Order order;

	@ManyToOne
	@JoinColumn(name = "OrderDetailId")
	private OrderDetail orderDetail;

	private long slOrder;

	private long slDoanhthu;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public long getSlOrder() {
		return slOrder;
	}

	public void setSlOrder(long slOrder) {
		this.slOrder = slOrder;
	}

	public long getSlDoanhthu() {
		return slDoanhthu;
	}

	public void setSlDoanhthu(long slDoanhthu) {
		this.slDoanhthu = slDoanhthu;
	}
	
}
