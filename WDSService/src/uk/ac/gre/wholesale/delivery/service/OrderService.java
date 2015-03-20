package uk.ac.gre.wholesale.delivery.service;

import java.util.Date;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.EJBConnector;
import uk.ac.gre.wholesale.delivery.dao.OrderDAO;
import uk.ac.gre.wholesale.delivery.dao.UserDAO;
import uk.ac.gre.wholesale.delivery.dao.WareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.OrderDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.UserDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.WareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.Order;
import uk.ac.gre.wholesale.delivery.entities.OrderItem;

@Path("order")
public class OrderService extends BaseService<Order, OrderDAO, OrderDaoImpl> {

	private WareHouseDAO wareHouseBean;

	private UserDAO userBean;

	public OrderService() {
		super(OrderDAO.class, OrderDaoImpl.class);
		wareHouseBean = new EJBConnector<WareHouseDAO, WareHouseDaoImpl>(
				WareHouseDAO.class, WareHouseDaoImpl.class).newInstance();
		userBean = (UserDAO) new EJBConnector<UserDAO, UserDaoImpl>(
				UserDAO.class, UserDaoImpl.class).newInstance();
	}

	@Override
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(@QueryParam("id") long id) {
		return super.delete(id);
	}
	
	private void calculateItem(Order order) {
		
	}
	
	private void doPackingOrderItem(Order order) {
		
	}

	@GET
	@Path("/updatestatus")
	@Produces("application/json")
	public boolean updateStatus(@QueryParam("id") long id,
			@QueryParam("status") int status) {
		Order order = find(id);
		if (order != null) {
			switch (status) {
			case Order.STATUS_AWAITING_ITEMS:
				// Now we check all item in all warehouse
				// Transfer if possible
				calculateItem(order);
				break;
			case Order.STATUS_BEING_PACKED:
				// Get all product in order
				// Prepare for delivery
				doPackingOrderItem(order);	
				break;
			case Order.STATUS_DELIVERED:
				// Done by man :D
				break;
			case Order.STATUS_DISPATCHED:
				// Just the latest confirm
				break;
			default:
				break;
			}
			order.setOrderStatus(status);
			getBean().edit(order);
			return true;
		}
		return false;
	}

	@Override
	@POST
	@Path("/save")
	@Produces("application/json")
	public Order save(final Order obj) {
		return super.save(obj);
	}

	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public Order find(@QueryParam("id") long id) {
		return updateData(super.find(id));
	}

	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Order> findAll() {
		return updateData(super.findAll());
	}

	public boolean checkout(Order order, long customerId, long wareHouseId) {
		OrderItemService orderItemService = new OrderItemService();
		order.setId(-1L);
		order.setUserId(customerId);
		order.setOrderStatus(Order.STATUS_PLACED);
		order.setWareHouseId(wareHouseId);
		order.setCreatedDate(new Date(System.currentTimeMillis()));
		if ((save(order)) != null) {
			long orderId = ((OrderDAO) getBean()).findLastestOrder().getId();
			for (OrderItem orderItem : order.getOrderItems()) {
				orderItem.setOrderId(orderId);
				orderItem.setId(-1L);
				orderItemService.save(orderItem);
			}
			return true;
		}
		return false;
	}
	
	public List<Order> findByCustomer(long id) {
		return updateData(((OrderDAO) getBean()).findByCustomer(id));
	}

	private List<Order> updateData(final List<Order> objects) {
		if (objects != null && objects.size() > 0) {
			for (final Order order : objects) {
				updateData(order);
			}
		}
		return objects;
	}

	private Order updateData(final Order order) {
		if (order != null) {
			order.setCustomer(userBean.find(order.getUserId()));
			order.setWareHouse(wareHouseBean.find(order.getWareHouseId()));
			OrderItemService orderItemService = new OrderItemService();
			order.setOrderItems(orderItemService.findByOrder(order.getId()));
		}
		return order;
	}
}
