package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.ProductTransfer;

@Remote
public interface ProductTransferDAO extends IBaseDAO<ProductTransfer>{
	public List<ProductTransfer> findByProduct(long productId);
}
