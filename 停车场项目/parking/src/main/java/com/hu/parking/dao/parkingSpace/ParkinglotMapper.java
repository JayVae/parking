package com.hu.parking.dao.parkingSpace;

import java.util.List;
import java.util.Map;

import com.hu.parking.dao.base.BaseMapper;
import com.hu.parking.dao.base.MyBatisRepository;
import com.hu.parking.entity.Parkinglot;

@MyBatisRepository
public interface ParkinglotMapper extends BaseMapper<Parkinglot> {
	public List<Parkinglot> findParkingplaceft(Map<String, Object> params);
}