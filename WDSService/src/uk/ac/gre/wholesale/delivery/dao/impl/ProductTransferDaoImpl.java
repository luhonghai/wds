package uk.ac.gre.wholesale.delivery.dao.impl;

import java.util.List;

import javax.ejb.Stateless;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductTransferDAO;
import uk.ac.gre.wholesale.delivery.entities.ProductTransfer;

@Stateless
public class ProductTransferDaoImpl extends BaseDAO<ProductTransfer> implements ProductTransferDAO {

	public ProductTransferDaoImpl() {
		super(ProductTransfer.class);
	}

	@Override
	public List<ProductTransfer> findByProduct(long productId) {
		return getEntityManager()
				.createQuery("SELECT u from " + ProductTransfer.class.getName() + " u "
							+ "WHERE u.productId=:pid ORDER BY status DESC", ProductTransfer.class)
				.setParameter("pid", productId)			
				.getResultList();
	}
}
