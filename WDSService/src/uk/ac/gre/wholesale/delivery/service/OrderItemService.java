package uk.ac.gre.wholesale.delivery.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import uk.ac.gre.wholesale.delivery.dao.OrderItemDAO;

import uk.ac.gre.wholesale.delivery.dao.impl.OrderItemDaoImpl;

import uk.ac.gre.wholesale.delivery.entities.OrderItem;

@Path("order-item")
public class OrderItemService extends BaseService<OrderItem, OrderItemDAO, OrderItemDaoImpl>{

	private ProductService productService;
	
	public OrderItemService() {
		super(OrderItemDAO.class, OrderItemDaoImpl.class);
		productService = new ProductService();
	}

	@Override
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(@QueryParam("id") long id) {
		return super.delete(id);
	}
	
	@Override
	@POST
	@Path("/save")
	@Produces("application/json")
	public OrderItem save(OrderItem obj) {
		return super.save(obj);
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public OrderItem find(@QueryParam("id") long id) {
		return super.find(id);
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<OrderItem> findAll() {
		return super.findAll();
	}
	
	private OrderItem updateData(final OrderItem orderItem) {
		if (orderItem != null) {
			orderItem.setProduct(productService.find(orderItem.getProductId()));
		}
		return orderItem;
	}
	
	private List<OrderItem> updateData(final List<OrderItem> objects) {
		if (objects != null && objects.size() > 0) {
			for (OrderItem orderItem : objects ) {
				updateData(orderItem);
			}
		}
		return objects;
	}
	
	public List<OrderItem> findByOrder(long id) {
		return updateData(((OrderItemDAO) getBean()).findByOrder(id));
	}
}
