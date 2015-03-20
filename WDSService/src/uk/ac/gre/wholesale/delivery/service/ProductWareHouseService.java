package uk.ac.gre.wholesale.delivery.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.EJBConnector;
import uk.ac.gre.wholesale.delivery.dao.ProductDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductWareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.WareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductWareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.WareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.ProductWareHouse;
import uk.ac.gre.wholesale.delivery.entities.WareHouse;

@Path("product-warehouse")
public class ProductWareHouseService extends BaseService<ProductWareHouse, ProductWareHouseDAO, ProductWareHouseDaoImpl>{

	private WareHouseDAO wareHouseBean;
	private ProductDAO productBean;
	
	public ProductWareHouseService() {
		super(ProductWareHouseDAO.class, ProductWareHouseDaoImpl.class);
		wareHouseBean = new EJBConnector<WareHouseDAO, WareHouseDaoImpl>(WareHouseDAO.class, WareHouseDaoImpl.class).newInstance();
		productBean = new EJBConnector<ProductDAO, ProductDaoImpl>(ProductDAO.class, ProductDaoImpl.class).newInstance();
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
	public ProductWareHouse save(ProductWareHouse obj) {
		ProductWareHouse oldData = ((ProductWareHouseDAO) getBean())
				.findProductWareHouse(obj.getProductId(), obj.getWareHouseId());
		if (oldData != null) {
			oldData.setStockLevel(obj.getStockLevel());
			return getBean().edit(oldData);
		} else {
			return super.save(obj);
		}
	}
	
	@GET
	@Path("/transfer")
	@Produces("application/json")
	public boolean transfer(@QueryParam("pid") long productId, 
					@QueryParam("fid") long fromWareHouseId,
					@QueryParam("tid") long toWareHouseId,
					@QueryParam("amount") int amount) {
		ProductWareHouse fromWareHouse = ((ProductWareHouseDAO) getBean())
				.findProductWareHouse(productId, fromWareHouseId);
		ProductWareHouse toWareHouse = ((ProductWareHouseDAO) getBean())
				.findProductWareHouse(productId, toWareHouseId);
		if (fromWareHouse != null) {
			int currentStockLevel = fromWareHouse.getStockLevel();
			if (amount > currentStockLevel) amount = currentStockLevel;
			fromWareHouse.setStockLevel(currentStockLevel - amount);
			if (toWareHouse == null) {
				toWareHouse = new ProductWareHouse();
				toWareHouse.setProductId(productId);
				toWareHouse.setWareHouseId(toWareHouseId);
				toWareHouse.setStockLevel(toWareHouse.getStockLevel() + amount);
				getBean().persist(toWareHouse);
			} else {
				toWareHouse.setStockLevel(toWareHouse.getStockLevel() + amount);
				getBean().edit(toWareHouse);
			}
			getBean().edit(fromWareHouse);
			return true;
		}
		return false;
	}
	
	@GET
	@Path("/add-amount")
	@Produces("application/json")
	public boolean addAmount(@QueryParam("pid") long productId, 
					@QueryParam("fid") long wareHouseId,
					@QueryParam("amount") int amount) {
		ProductWareHouse obj = ((ProductWareHouseDAO) getBean())
				.findProductWareHouse(productId, wareHouseId);
		System.out.println("Pid: " + productId + ". Fid: " + wareHouseId + ". Amount: " + amount);
		if (obj != null) {
			obj.setStockLevel(obj.getStockLevel() + amount);
			getBean().edit(obj);
		} else {
			obj = new ProductWareHouse();
			obj.setProductId(productId);
			obj.setWareHouseId(wareHouseId);
			obj.setStockLevel(amount);
			getBean().persist(obj);
		}
		return true;
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public ProductWareHouse find(@QueryParam("id") long id) {
		
		return updateData(super.find(id));
	}
	
	private ProductWareHouse updateData(final ProductWareHouse obj) {
		if (obj != null) {
			obj.setProduct(productBean.find(obj.getProductId()));
			obj.setWareHouse(wareHouseBean.find(obj.getWareHouseId()));
		}
		return obj;
	}
	
	private List<ProductWareHouse> updateData(List<ProductWareHouse> objects) {
		if (objects != null && objects.size() > 0) {
			for (final ProductWareHouse obj : objects) {
				updateData(obj);
			}
		}
		return objects;
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<ProductWareHouse> findAll() {
		return updateData(super.findAll());
	}
	
	@GET
	@Path("/listbyproduct")
	@Produces("application/json")
	public List<ProductWareHouse> findAllByProduct(@QueryParam("id") long productId) {
		List<ProductWareHouse> objects = ((ProductWareHouseDAO) getBean()).findByProductId(productId);
		List<WareHouse> wareHouses = wareHouseBean.findAll();
		if (wareHouses != null && wareHouses.size() > 0) {
			if (objects == null) objects = new ArrayList<ProductWareHouse>();
			for (WareHouse wh : wareHouses) {
				boolean found = false;
				for (final ProductWareHouse pwh : objects) {
					if (pwh.getWareHouseId() == wh.getId()) {
						found = true;
						break;
					}
				}
				if (!found) {
					ProductWareHouse pwh = new ProductWareHouse();
					pwh.setWareHouseId(wh.getId());
					pwh.setProductId(productId);
					objects.add(pwh);
				}
			}
		}
		return updateData(objects);
	}
	
	public ProductWareHouse findProductWareHouse(long warehouseId, long productId) {
		return updateData(((ProductWareHouseDAO) getBean()).findProductWareHouse(productId, warehouseId));
	}
}
