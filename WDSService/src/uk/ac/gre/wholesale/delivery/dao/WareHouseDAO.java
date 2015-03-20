package uk.ac.gre.wholesale.delivery.dao;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.WareHouse;

@Remote
public interface WareHouseDAO extends IBaseDAO<WareHouse> {

}
