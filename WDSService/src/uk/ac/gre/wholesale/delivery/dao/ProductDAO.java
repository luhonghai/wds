package uk.ac.gre.wholesale.delivery.dao;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.Product;

@Remote
public interface ProductDAO extends IBaseDAO<Product> {

}
