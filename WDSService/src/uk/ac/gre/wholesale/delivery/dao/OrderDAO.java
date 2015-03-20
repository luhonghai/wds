package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.Order;

@Remote
public interface OrderDAO  extends IBaseDAO<Order> {
	public List<Order> findByCustomer(long userId);
	
	public Order findLastestOrder();
}
