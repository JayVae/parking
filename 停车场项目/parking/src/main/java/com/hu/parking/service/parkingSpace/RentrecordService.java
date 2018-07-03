package com.hu.parking.service.parkingSpace;

import java.util.List;
import java.util.Map;

import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Rentrecord;
import com.hu.parking.service.base.BaseService;
import com.hu.parking.vo.IncomeVo;

public interface RentrecordService extends BaseService<Rentrecord> {
	public List<Rentrecord> findByNParams(Map<String, Object> params);
	public List<IncomeVo> sumOfIncome (Map<String, Object> params);
}
