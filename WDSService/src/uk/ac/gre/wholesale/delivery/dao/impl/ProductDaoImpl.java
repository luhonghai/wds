package uk.ac.gre.wholesale.delivery.dao.impl;

import javax.ejb.Stateless;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.ProductDAO;
import uk.ac.gre.wholesale.delivery.entities.Product;

@Stateless
public class ProductDaoImpl extends BaseDAO<Product> implements ProductDAO {

	public ProductDaoImpl() {
		super(Product.class);
	}

}
