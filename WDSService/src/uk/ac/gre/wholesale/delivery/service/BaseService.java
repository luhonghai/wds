package uk.ac.gre.wholesale.delivery.service;

import java.util.List;

import uk.ac.gre.wholesale.delivery.EJBConnector;
import uk.ac.gre.wholesale.delivery.dao.IBaseDAO;
import uk.ac.gre.wholesale.delivery.entities.IBaseEntity;

public abstract class BaseService<B, T, K> {
	private final IBaseDAO<B> bean;
	
	@SuppressWarnings("unchecked")
	public BaseService(Class<T> remoteClass, Class<K> statelessClass) {
		this.bean = (IBaseDAO<B>) new EJBConnector<T,K>(remoteClass, statelessClass).newInstance();
	}
	
	protected IBaseDAO<B> getBean() {
		return bean;
	}
	
	public List<B> findAll() {
		try {
			return bean.findAll();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public B find(long id) {
		try {
			return bean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public B save(final B obj) {
		try {
			if (((IBaseEntity) obj).getId() > 0) {
				return bean.edit(obj);
			} else {
				((IBaseEntity) obj).setId(0L);
				return bean.persist(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean delete(long id) {
		try {
			bean.remove(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
