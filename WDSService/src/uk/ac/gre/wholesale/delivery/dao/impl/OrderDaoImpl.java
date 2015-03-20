package uk.ac.gre.wholesale.delivery.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.OrderDAO;
import uk.ac.gre.wholesale.delivery.entities.Order;

@Stateless
public class OrderDaoImpl extends BaseDAO<Order> implements OrderDAO {

	public OrderDaoImpl() {
		super(Order.class);
	}

	@Override
	public List<Order> findByCustomer(long userId) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.userId=:ui ORDER BY createdDate desc", Order.class)
				.setParameter("ui", userId)			
				.getResultList();
	}

	@Override
	public Order findLastestOrder() {
		try {
			return getEntityManager()
					.createQuery("SELECT u from " + Order.class.getName() + " u "
								+ " ORDER BY id desc", Order.class)
								.setFirstResult(0).setMaxResults(1)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
