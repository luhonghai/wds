package uk.ac.gre.wholesale.delivery.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductWareHouseDAO;
import uk.ac.gre.wholesale.delivery.entities.ProductWareHouse;

@Stateless
public class ProductWareHouseDaoImpl extends BaseDAO<ProductWareHouse> implements ProductWareHouseDAO {

	public ProductWareHouseDaoImpl() {
		super(ProductWareHouse.class);
	}

	@Override
	public List<ProductWareHouse> findByProductId(long productId) {
		return getEntityManager()
				.createQuery("SELECT u from " + ProductWareHouse.class.getName() + " u "
							+ "WHERE u.productId=:pid", ProductWareHouse.class)
				.setParameter("pid", productId)			
				.getResultList();
	}

	@Override
	public List<ProductWareHouse> findByWareHouse(long wareHouseId) {
		return getEntityManager()
				.createQuery("SELECT u from " + ProductWareHouse.class.getName() + " u "
							+ "WHERE u.wareHouseId=:wid", ProductWareHouse.class)
				.setParameter("wid", wareHouseId)			
				.getResultList();
	}

	@Override
	public ProductWareHouse findProductWareHouse(long productId,
			long wareHouseId) {
		try {
		return getEntityManager()
				.createQuery("SELECT u from " + ProductWareHouse.class.getName() + " u "
							+ "WHERE u.wareHouseId=:wid AND u.productId=:pid", ProductWareHouse.class)
				.setParameter("wid", wareHouseId)
				.setParameter("pid", productId)
				.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
