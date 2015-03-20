package uk.ac.gre.wholesale.delivery.dao;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.healthmarketscience.jackcess.CursorBuilder;
import com.healthmarketscience.jackcess.Database;
import com.healthmarketscience.jackcess.DatabaseBuilder;
import com.healthmarketscience.jackcess.Row;
import com.healthmarketscience.jackcess.Table;

public class LocationDistance {

	public static int getLocationId(String locationName) {
		if (locationName == null)
			return -1;
		if (locationName.equalsIgnoreCase("london")) {
			return 1;
		} else if (locationName.equalsIgnoreCase("manchester")) {
			return 2;
		} else if (locationName.equalsIgnoreCase("birmingham")) {
			return 3;
		} else if (locationName.equalsIgnoreCase("leeds")) {
			return 4;
		} else if (locationName.equalsIgnoreCase("liverpool")) {
			return 5;
		} else if (locationName.equalsIgnoreCase("southampton")) {
			return 6;
		} else if (locationName.equalsIgnoreCase("newcastle")) {
			return 7;
		} else if (locationName.equalsIgnoreCase("nottingham")) {
			return 8;
		} else if (locationName.equalsIgnoreCase("sheffield")) {
			return 9;
		} else if (locationName.equalsIgnoreCase("britol")) {
			return 10;
		}
		return -1;
	}

	public static long calculate(int fromId, int toId) {
		try {
			File tmpDb = new File(FileUtils.getTempDirectory(), "database.mdb");
			if (!tmpDb.exists()) {
				FileUtils
						.copyInputStreamToFile(
								LocationDistance.class.getClassLoader()
										.getResourceAsStream(
												"/database/distances.mdb"),
								tmpDb);
			}
			Database db = DatabaseBuilder.open(tmpDb);
			Table table = db.getTable("Distance");
			Map<String, Object> criteria = new HashMap<String, Object>();
			for (Row row : table) {
				System.out.println(row.get("Town1") + " - " + row.get("Town2"));
			}
			criteria.put("Town1", fromId);
			criteria.put("Town2", toId);
			Row row = CursorBuilder.findRow(table, criteria);
			if (row == null) {
				criteria = new HashMap<String, Object>();
				criteria.put("Town1", toId);
				criteria.put("Town2", fromId);
				row = CursorBuilder.findRow(table, criteria);
			}
			if (row != null) {
				return Long.parseLong(row.get("DistanceInMiles").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
