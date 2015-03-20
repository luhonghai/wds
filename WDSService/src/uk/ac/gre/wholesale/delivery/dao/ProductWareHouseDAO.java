package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.ProductWareHouse;

@Remote
public interface ProductWareHouseDAO extends IBaseDAO<ProductWareHouse>{
	
	public List<ProductWareHouse> findByProductId(long productId);
	
	public List<ProductWareHouse> findByWareHouse(long wareHouseId);
	
	public ProductWareHouse findProductWareHouse(long productId, long wareHouseId);
}
