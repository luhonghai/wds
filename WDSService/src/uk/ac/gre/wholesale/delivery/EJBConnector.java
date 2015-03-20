package uk.ac.gre.wholesale.delivery;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class EJBConnector<T,K> {
	
	
	private static Context context;
	private Class<T> remoteClass;
	private Class<K> statelessClass;
	
	public EJBConnector(Class<T> rc, Class<K> sc) {
		this.remoteClass = rc;
		this.statelessClass = sc;
	}
	
	private Context getContext() throws NamingException {
		if (context == null) {
			Properties properties = new Properties();
			properties.put(Context.URL_PKG_PREFIXES, Constant.PKG_INTERFACES);
			properties.put("jboss.naming.client.ejb.context", true);
			context = new InitialContext(properties);
		}
		return context;
	}
	
	@SuppressWarnings("unchecked")
	public T newInstance() {
		try {
			return (T) getContext().lookup("ejb:" + Constant.APP_NAME + "/" 
					+ Constant.MODULE_NAME + "/" 
					+ Constant.DISTINCT_NAME + "/" 
					+ statelessClass.getSimpleName() + "!"
					+ remoteClass.getName());
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
