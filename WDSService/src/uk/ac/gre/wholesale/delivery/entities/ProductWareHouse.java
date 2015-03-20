package uk.ac.gre.wholesale.delivery.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name="product_warehouse")
public class ProductWareHouse implements Serializable, IBaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1619884833510311372L;

	@Id
	private long id;
	
	@Column(name="product_id")
	private long productId;
	
	@Column(name="warehouse_id")
	private long wareHouseId;
	
	@Column(name="stock_level")
	private int stockLevel;
	
	@Transient
	private WareHouse wareHouse;
	
	@Transient
	private Product product;
	

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

	public long getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(long wareHouseId) {
		this.wareHouseId = wareHouseId;
	}

	public int getStockLevel() {
		return stockLevel;
	}

	public void setStockLevel(int stockLevel) {
		this.stockLevel = stockLevel;
	}

	public WareHouse getWareHouse() {
		return wareHouse;
	}

	public void setWareHouse(WareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
