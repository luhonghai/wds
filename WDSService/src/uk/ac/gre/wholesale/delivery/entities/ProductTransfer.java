package uk.ac.gre.wholesale.delivery.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name="product_transfer")
public class ProductTransfer implements Serializable, IBaseEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8768027186420551815L;

	public static final int STATUS_PENDING = 0;
	
	public static final int STATUS_TRANSFERING = 1;
	
	public static final int STATUS_DONE = 2;
	
	@Id
	private long id;
	
	@Column(name="product_id")
	private long productId;
	
	@Column(name="from_warehouse_id")
	private long fromWareHouseId;
	
	@Column(name="to_warehouse_id")
	private long toWareHouseId;
	
	@Column(name="total_miles")
	private int totalMiles;
	
	private int quantity;
	
	@Column(name="transfered_date")
	private Date transferedDate;
	
	@Column(name="departure_date")
	private Date departureDate;
	
	private int status;
	
	@Transient
	private Product product;
	
	@Transient
	private WareHouse fromWareHouse;
	
	@Transient
	private WareHouse toWareHouse;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public long getFromWareHouseId() {
		return fromWareHouseId;
	}

	public void setFromWareHouseId(long fromWareHouseId) {
		this.fromWareHouseId = fromWareHouseId;
	}

	public long getToWareHouseId() {
		return toWareHouseId;
	}

	public void setToWareHouseId(long toWareHouseId) {
		this.toWareHouseId = toWareHouseId;
	}

	public int getTotalMiles() {
		return totalMiles;
	}

	public void setTotalMiles(int totalMiles) {
		this.totalMiles = totalMiles;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getTransferedDate() {
		return transferedDate;
	}

	public void setTransferedDate(Date transferedDate) {
		this.transferedDate = transferedDate;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public WareHouse getFromWareHouse() {
		return fromWareHouse;
	}

	public void setFromWareHouse(WareHouse fromWareHouse) {
		this.fromWareHouse = fromWareHouse;
	}

	public WareHouse getToWareHouse() {
		return toWareHouse;
	}

	public void setToWareHouse(WareHouse toWareHouse) {
		this.toWareHouse = toWareHouse;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
