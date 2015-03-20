package uk.ac.gre.wholesale.delivery.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import uk.ac.gre.wholesale.delivery.dao.LocationDistance;

@Entity(name="warehouse")
public class WareHouse implements Serializable, IBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8285820555529109503L;

	@Id
	private long id;
	
	private String name;
	
	private String location;
	
	@Transient
	private int locationId;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getLocationId() {
		return LocationDistance.getLocationId(location);
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
}
