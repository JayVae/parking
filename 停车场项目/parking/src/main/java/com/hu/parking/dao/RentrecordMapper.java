package com.hu.parking.dao;

import java.util.List;
import java.util.Map;

import com.hu.parking.dao.base.BaseMapper;
import com.hu.parking.dao.base.MyBatisRepository;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Rentrecord;
import com.hu.parking.vo.IncomeVo;

@MyBatisRepository
public interface RentrecordMapper extends BaseMapper<Rentrecord> {
	public List<Rentrecord> findByNParams(Map<String, Object> params);
	
	public List<IncomeVo> sumOfIncome (Map<String, Object> params);
}