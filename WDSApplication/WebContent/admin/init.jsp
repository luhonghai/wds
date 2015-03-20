<%@page import="uk.ac.gre.wholesale.delivery.entities.WareHouse"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.WareHouseService"%>
<%@page import="java.util.List"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.UserService"%>
<%
	UserService service = new UserService();
	List<User> users = service.findAll();
	if (users == null || users.size() == 0) {
		User user = new User();
		user.setEmail("admin@wds.com");
		user.setPassword("admin");
		user.setId(-1L);
	}
	WareHouseService wareHouseService = new WareHouseService();
	List<WareHouse> wareHouses = wareHouseService.findAll();
	if (wareHouses == null || wareHouses.size() == 0) {
		WareHouse wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("London");
		wareHouse.setLocation("London");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Manchester");
		wareHouse.setLocation("Manchester");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Birmingham");
		wareHouse.setLocation("Birmingham");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Leeds");
		wareHouse.setLocation("Leeds");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Liverpool");
		wareHouse.setLocation("Liverpool");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Southampton");
		wareHouse.setLocation("Southampton");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Newcastle");
		wareHouse.setLocation("Newcastle");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Nottingham");
		wareHouse.setLocation("Nottingham");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Sheffield");
		wareHouse.setLocation("Sheffield");
		wareHouseService.save(wareHouse);
		
		wareHouse = new WareHouse();
		wareHouse.setId(-1L);
		wareHouse.setName("Britol");
		wareHouse.setLocation("Britol");
		wareHouseService.save(wareHouse);
	}
%>