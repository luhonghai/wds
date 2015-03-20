package uk.ac.gre.wholesale.delivery.dao.impl;

import java.util.List;

import javax.ejb.Stateless;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.OrderItemDAO;
import uk.ac.gre.wholesale.delivery.entities.OrderItem;

@Stateless
public class OrderItemDaoImpl extends BaseDAO<OrderItem> implements OrderItemDAO {

	public OrderItemDaoImpl() {
		super(OrderItem.class);
	}

	@Override
	public List<OrderItem> findByOrder(long orderId) {
		return getEntityManager()
				.createQuery("SELECT u from " + OrderItem.class.getName() + " u "
							+ "WHERE u.orderId=:oi", OrderItem.class)
				.setParameter("oi", orderId)			
				.getResultList();
	}

}
