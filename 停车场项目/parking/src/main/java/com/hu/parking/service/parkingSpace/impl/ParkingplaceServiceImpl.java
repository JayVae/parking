package com.hu.parking.service.parkingSpace.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.parkingSpace.ParkingplaceMapper;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.parkingSpace.ParkingplaceService;

@Service("parkingplaceService")
public class ParkingplaceServiceImpl extends BaseServiceImpl<Parkingplace> implements ParkingplaceService {
	
	@Autowired
	ParkingplaceMapper parkingplaceMapper;

	public List<Parkingplace> findByNParams(Map<String, Object> params) {
		return parkingplaceMapper.findByNParams(params);
	}
}
