package uk.ac.gre.wholesale.delivery.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name="order_item")
public class OrderItem implements Serializable , IBaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8531492319280535932L;

	@Id
	private long id;
	
	@Column(name="order_id")
	private long orderId;
	
	@Column(name="product_id")
	private long productId;
	
	private int quantity;
	
	@Column(name="item_status")
	private int itemStatus;
	
	@Transient
	private Product product;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(int itemStatus) {
		this.itemStatus = itemStatus;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
