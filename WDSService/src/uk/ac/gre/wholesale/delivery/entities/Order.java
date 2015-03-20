package uk.ac.gre.wholesale.delivery.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name="`order`")
public class Order implements Serializable, IBaseEntity {
	
	public static final int STATUS_PLACED = 0;
	
	public static final int STATUS_AWAITING_ITEMS = 1;
	
	public static final int STATUS_BEING_PACKED = 2;
	
	public static final int STATUS_DISPATCHED = 3;
	
	public static final int STATUS_DELIVERED = 4;
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 5655605590362612973L;

	@Id
	private long id;
	
	@Column(name="user_id")
	private long userId;
	
	@Column(name="warehouse_id")
	private long wareHouseId;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="order_status")
	private int orderStatus;
	
	@Transient
	private User customer;
	
	@Transient
	private WareHouse wareHouse;
	
	@Transient
	private List<OrderItem> orderItems;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(long wareHouseId) {
		this.wareHouseId = wareHouseId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public WareHouse getWareHouse() {
		return wareHouse;
	}

	public void setWareHouse(WareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	public List<OrderItem> getOrderItems() {
		if (orderItems == null) orderItems = new ArrayList<OrderItem>();
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
	public float getTotalPrice() {
		float totalPrice = 0;
		for (OrderItem orderItem : getOrderItems()) {
			totalPrice += (orderItem.getProduct().getPrice() * orderItem.getQuantity());
		}
		return totalPrice;
	}
}
