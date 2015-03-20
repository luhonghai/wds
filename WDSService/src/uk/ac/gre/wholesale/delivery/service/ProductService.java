package uk.ac.gre.wholesale.delivery.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.EJBConnector;
import uk.ac.gre.wholesale.delivery.dao.ProductDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductWareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductWareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.Product;
import uk.ac.gre.wholesale.delivery.entities.ProductWareHouse;

@Path("product")
public class ProductService extends BaseService<Product, ProductDAO, ProductDaoImpl>{

	private ProductWareHouseDAO productWareHouseBean;
	
	public ProductService() {
		super(ProductDAO.class, ProductDaoImpl.class);
		productWareHouseBean = (ProductWareHouseDAO) new EJBConnector<ProductWareHouseDAO, ProductWareHouseDaoImpl>(ProductWareHouseDAO.class, ProductWareHouseDaoImpl.class).newInstance();
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
	public Product save(Product obj) {
		return super.save(obj);
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public Product find(@QueryParam("id") long id) {
		return updateData(super.find(id));
	}
	
	private Product updateData(final Product product) {
		if (product != null) {
			int totalStockLevel = 0;
			List<ProductWareHouse> objs = productWareHouseBean.findByProductId(product.getId());
			if (objs != null && objs.size() > 0) {
				for (ProductWareHouse pwh : objs) {
					totalStockLevel += pwh.getStockLevel();
				}
			}
			product.setStockLevel(totalStockLevel);
		}
		return product;
	}
	
	private List<Product> updateData(final List<Product> objects) {
		if (objects !=  null && objects.size() > 0) {
			for (final Product product : objects) {
				updateData(product);
			}
		}
		return objects;
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Product> findAll() {
		return updateData(super.findAll());
	}
}
