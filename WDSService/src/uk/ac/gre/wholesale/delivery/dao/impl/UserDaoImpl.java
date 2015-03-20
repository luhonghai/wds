package uk.ac.gre.wholesale.delivery.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;

import uk.ac.gre.wholesale.delivery.dao.BaseDAO;
import uk.ac.gre.wholesale.delivery.dao.UserDAO;
import uk.ac.gre.wholesale.delivery.entities.User;

@Stateless
public class UserDaoImpl extends BaseDAO<User> implements UserDAO {

	public UserDaoImpl() {
		super(User.class);
	}

	@Override
	public User login(String username, String password, int role) {
		try {
		return getEntityManager()
				.createQuery("SELECT u from " + User.class.getName() + " u " 
								+"WHERE u.email=:e and u.password=:p and u.role=:r", User.class)
				.setParameter("e", username)
				.setParameter("p", password)
				.setParameter("r", role)
				.setFirstResult(0)
				.setMaxResults(1)
				.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public List<User> findByRole(int role) {
		return getEntityManager()
				.createQuery("SELECT u from " + User.class.getName() + " u "
							+ "WHERE u.role=:r", User.class)
				.setParameter("r", role)			
				.getResultList();
	}

}
