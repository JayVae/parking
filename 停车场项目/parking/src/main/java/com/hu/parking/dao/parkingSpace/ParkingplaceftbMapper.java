package com.hu.parking.dao.parkingSpace;

import java.io.Serializable;

import com.hu.parking.dao.base.BaseMapper;
import com.hu.parking.dao.base.MyBatisRepository;
import com.hu.parking.entity.Parkingplaceftb;

@MyBatisRepository
public interface ParkingplaceftbMapper extends BaseMapper<Parkingplaceftb>{
	public int deleteByPpftid(Serializable id);
}