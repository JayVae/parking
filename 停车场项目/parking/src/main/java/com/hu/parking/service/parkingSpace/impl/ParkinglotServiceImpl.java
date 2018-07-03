package com.hu.parking.service.parkingSpace.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.parkingSpace.ParkinglotMapper;
import com.hu.parking.entity.Parkinglot;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.parkingSpace.ParkinglotService;

@Service("parkinglotService")
public class ParkinglotServiceImpl extends BaseServiceImpl<Parkinglot> implements ParkinglotService {
	
	@Autowired
	ParkinglotMapper parkinglotMapper;
	
	public List<Parkinglot> findParkingplaceft(Map<String, Object> params){
		return parkinglotMapper.findParkingplaceft(params);
	}
}
