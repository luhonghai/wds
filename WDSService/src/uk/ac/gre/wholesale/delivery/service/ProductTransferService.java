package uk.ac.gre.wholesale.delivery.service;

import java.util.Date;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.EJBConnector;
import uk.ac.gre.wholesale.delivery.dao.ProductDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductTransferDAO;
import uk.ac.gre.wholesale.delivery.dao.WareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.ProductTransferDaoImpl;
import uk.ac.gre.wholesale.delivery.dao.impl.WareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.ProductTransfer;

@Path("product-transfer")
public class ProductTransferService extends BaseService<ProductTransfer, ProductTransferDAO, ProductTransferDaoImpl>{

	private WareHouseDAO wareHouseBean;
	private ProductDAO productBean;
	
	public ProductTransferService() {
		super(ProductTransferDAO.class, ProductTransferDaoImpl.class);
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
	public ProductTransfer save(ProductTransfer obj) {
		return super.save(obj);
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public ProductTransfer find(@QueryParam("id") long id) {
		return updateData(super.find(id));
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<ProductTransfer> findAll() {
		return updateData(super.findAll());
	}
	
	@GET
	@Path("/listbyproduct")
	@Produces("application/json")
	public List<ProductTransfer> findByProduct(@QueryParam("id") long id) {
		return updateData(((ProductTransferDAO) getBean()).findByProduct(id));
	}
	
	@GET
	@Path("/updatestatus")
	@Produces("application/json")
	public boolean updateStatus(@QueryParam("id") long id, @QueryParam("status") int status) {
		ProductTransfer pt = getBean().find(id);
		pt.setStatus(status);
		if (status == ProductTransfer.STATUS_DONE) {
			pt.setDepartureDate(new Date(System.currentTimeMillis()));
			ProductWareHouseService wareHouseService = new ProductWareHouseService();
			wareHouseService.transfer(pt.getProductId(), pt.getFromWareHouseId(), pt.getToWareHouseId(), pt.getQuantity());
		} else if (status == ProductTransfer.STATUS_TRANSFERING) {
			pt.setTransferedDate(new Date(System.currentTimeMillis()));
		}
		getBean().edit(pt);
		return true;
	}
	
	private List<ProductTransfer> updateData(final List<ProductTransfer> objects) {
		if (objects != null && objects.size() > 0) {
			for (final ProductTransfer obj : objects) {
				updateData(obj);
			}
		}
		return objects;
	}
	
	private ProductTransfer updateData(final ProductTransfer obj) {
		if (obj != null) {
			obj.setProduct(productBean.find(obj.getProductId()));
			obj.setToWareHouse(wareHouseBean.find(obj.getToWareHouseId()));
			obj.setFromWareHouse(wareHouseBean.find(obj.getFromWareHouseId()));
		}
		return obj;
	}
}
