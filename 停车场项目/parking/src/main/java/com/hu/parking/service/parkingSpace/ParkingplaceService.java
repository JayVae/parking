package com.hu.parking.service.parkingSpace;

import java.util.List;
import java.util.Map;

import com.hu.parking.entity.Parkingplace;
import com.hu.parking.service.base.BaseService;

public interface ParkingplaceService extends BaseService<Parkingplace> {
	public List<Parkingplace> findByNParams(Map<String, Object> params);
}
