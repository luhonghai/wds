package uk.ac.gre.wholesale.delivery.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.dao.WareHouseDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.WareHouseDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.WareHouse;

@Path("warehouse")
public class WareHouseService extends BaseService<WareHouse, WareHouseDAO, WareHouseDaoImpl>{

	public WareHouseService() {
		super(WareHouseDAO.class, WareHouseDaoImpl.class);
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
	public WareHouse save(WareHouse obj) {
		return super.save(obj);
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public WareHouse find(@QueryParam("id") long id) {
		return super.find(id);
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<WareHouse> findAll() {
		return super.findAll();
	}
}
