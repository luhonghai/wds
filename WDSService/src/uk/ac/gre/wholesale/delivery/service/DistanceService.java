package uk.ac.gre.wholesale.delivery.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import uk.ac.gre.wholesale.delivery.dao.LocationDistance;

@Path("/xml/distance")
public class DistanceService {
	
	@GET
	@Path("/calculate")
	@Produces("application/xml")
	public DistanceML getDistanceML(
						@QueryParam("town1")
						int town1,
						@QueryParam("town2")
						int town2) {
		DistanceML dMl = new DistanceML();
		Item item = new Item();
		item.setTown1(town1);
		item.setTown2(town2);
		item.setDistanceInMiles(LocationDistance.calculate(town1, town2));
		dMl.addItem(item);
		return dMl;
	}
	
	@XmlRootElement(name = "Item")
	public static class Item {
		private int town1;
		private int town2;
		private long distanceInMiles;
		@XmlElement(name="Town1")
		public int getTown1() {
			return town1;
		}
		public void setTown1(int town1) {
			this.town1 = town1;
		}
		@XmlElement(name="Town2")
		public int getTown2() {
			return town2;
		}
		
		public void setTown2(int town2) {
			this.town2 = town2;
		}
		@XmlElement(name="DistanceInMiles")
		public long getDistanceInMiles() {
			return distanceInMiles;
		}
		public void setDistanceInMiles(long distanceInMiles) {
			this.distanceInMiles = distanceInMiles;
		}
	}
	
	@XmlRootElement(name = "DistanceML")
	public static class DistanceML {
		private List<Item> items;
		
		public void addItem(Item item) {
			if (items == null) items = new ArrayList<DistanceService.Item>();
			items.add(item);
		}

		@XmlElement(name="Item")
		public List<Item> getItems() {
			return items;
		}

		public void setItems(List<Item> items) {
			this.items = items;
		}
	}
}
