package com.hu.parking.service.parkingSpace.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.RentrecordMapper;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Rentrecord;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.parkingSpace.RentrecordService;
import com.hu.parking.vo.IncomeVo;

@Service("rentrecordService")
public class RentrecordServiceImpl extends BaseServiceImpl<Rentrecord> implements RentrecordService {
	
	@Autowired
	RentrecordMapper rentrecordMapper;
	
	public List<Rentrecord> findByNParams(Map<String, Object> params){
		return rentrecordMapper.findByNParams(params);
	}
	
	public List<IncomeVo> sumOfIncome (Map<String, Object> params){
		return rentrecordMapper.sumOfIncome(params);
	}
}
