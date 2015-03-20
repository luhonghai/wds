package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.wholesale.delivery.entities.User;

@Remote
public interface UserDAO extends IBaseDAO<User> {
	public User login(String username, String password, int role);
	
	public List<User> findByRole(int role);
}
