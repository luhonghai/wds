package uk.ac.gre.wholesale.delivery.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.wholesale.delivery.dao.UserDAO;
import uk.ac.gre.wholesale.delivery.dao.impl.UserDaoImpl;
import uk.ac.gre.wholesale.delivery.entities.User;

@Path("user")
public class UserService extends BaseService<User, UserDAO, UserDaoImpl>{

	public UserService() {
		super(UserDAO.class, UserDaoImpl.class);
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
	public User save(User obj) {
		if (obj.getId() > 0) {
			User tmp = getBean().find(obj.getId());
			tmp.setAddress(obj.getAddress());
			tmp.setDob(obj.getDob());
			tmp.setEmail(obj.getEmail());
			tmp.setFirstName(obj.getFirstName());
			tmp.setGender(obj.isGender());
			if (obj.getPassword() != null && obj.getPassword().length() > 0) {
				tmp.setPassword(md5(obj.getPassword()));
			}
			tmp.setPhone(obj.getPhone());
			tmp.setLastName(obj.getLastName());
			tmp.setRole(obj.getRole());
			return getBean().edit(tmp);
		} else {
			obj.setPassword(md5(obj.getPassword()));
			return super.save(obj);	
		}
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public User find(@QueryParam("id") long id) {
		return super.find(id);
	}
	
	@GET
	@Path("/findbyrole")
	@Produces("application/json")
	public List<User> findByRole(@QueryParam("role") int role) {
		return ((UserDAO) getBean()).findByRole(role);
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<User> findAll() {
		return super.findAll();
	}
	
	public User login(String username, String password, int role) {
		return ((UserDAO) getBean()).login(username, md5(password), role);
	}
	
	private String md5(String input) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            return "";
        }
        md.update(input.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }


        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
        for (int i=0;i<byteData.length;i++) {
            String hex=Integer.toHexString(0xff & byteData[i]);
            if(hex.length()==1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
