package com.hu.parking.service.parkingSpace;

import java.util.List;
import java.util.Map;

import com.hu.parking.entity.Parkingplacefreetime;
import com.hu.parking.entity.Parkingplaceftb;
import com.hu.parking.service.base.BaseService;

public interface ParkingplacefreetimeService extends BaseService<Parkingplacefreetime> {

	public int addParkingplacefreetime(List<Parkingplacefreetime> parkingplacefreetimeList);
	public int updateParkingplacefreetime(Parkingplacefreetime parkingplacefreetime, List<Parkingplaceftb> parkingplaceftbList);
	
	public int deleteParkingplacefreetime(String parkingplacefreetimeid);
	
}
