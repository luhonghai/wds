package uk.ac.gre.wholesale.delivery.dao.impl;

import javax.ejb.Stateless;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.WareHouseDAO;
import uk.ac.gre.wholesale.delivery.entities.WareHouse;

@Stateless
public class WareHouseDaoImpl extends BaseDAO<WareHouse> implements WareHouseDAO {

	public WareHouseDaoImpl() {
		super(WareHouse.class);
	}

}
