package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.OrderItem;

@Remote
public interface OrderItemDAO extends IBaseDAO<OrderItem> {
	
	public List<OrderItem> findByOrder(long orderId);
}
