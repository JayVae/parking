package com.hu.parking.service.parkingSpace.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JavaType;
import com.hu.parking.dao.ParkingplacefreetimeMapper;
import com.hu.parking.dao.PpftbuserecordMapper;
import com.hu.parking.dao.parkingSpace.ParkinglotMapper;
import com.hu.parking.dao.parkingSpace.ParkingplaceMapper;
import com.hu.parking.dao.parkingSpace.ParkingplaceftbMapper;
import com.hu.parking.entity.Parkinglot;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Parkingplacefreetime;
import com.hu.parking.entity.Parkingplaceftb;
import com.hu.parking.entity.Ppftbuserecord;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.parkingSpace.ParkingplacefreetimeService;
import com.hu.parking.util.Identities;
import com.hu.parking.util.JsonBinder;

@Service("parkingplacefreetimeService")
public class ParkingplacefreetimeServiceImpl extends BaseServiceImpl<Parkingplacefreetime> implements ParkingplacefreetimeService {
	
	@Autowired
	ParkingplacefreetimeMapper parkingplacefreetimeMapper;
	
	@Autowired
	ParkingplaceftbMapper parkingplaceftbMapper;
	
	@Autowired
	PpftbuserecordMapper ppftbuserecordMapper;
	
	@Autowired
	ParkingplaceMapper parkingplaceMapper;
	
	@Autowired
	ParkinglotMapper parkinglotMapper;
	
	
	public int addParkingplacefreetime(List<Parkingplacefreetime> parkingplacefreetimeList){
		Integer result = 0;
		Map<String, Object> params = new HashMap<String, Object>();
		for (int j = 0; j < parkingplacefreetimeList.size(); j++) {
			Parkingplacefreetime parkingplacefreetime = parkingplacefreetimeList.get(j);
			parkingplacefreetime.setParkingplacefreetimeid(Identities.uuid());
			result = parkingplacefreetimeMapper.insertSelective(parkingplacefreetime);
		}
		return result;
	}
	
	
	public int updateParkingplacefreetime(Parkingplacefreetime parkingplacefreetime, List<Parkingplaceftb> parkingplaceftbList){
		Integer result = 0;
//		String parkingplacefreetimeid = parkingplacefreetime.getParkingplacefreetimeid();
//		result = ppftbuserecordMapper.deleteByPpftid(parkingplacefreetimeid);
//		result = parkingplaceftbMapper.deleteByPpftid(parkingplacefreetimeid);
//			result = parkingplacefreetimeMapper.updateByPrimaryKeySelective(parkingplacefreetime);
//			if (result == 1) {
//				for (int i = 0; i < parkingplaceftbList.size(); i++) {
//					Parkingplaceftb parkingplaceftb = parkingplaceftbList.get(i);
//					parkingplaceftb.setParkingplacefreetimeid(parkingplacefreetimeid);
//					String parkingplaceftbid = Identities.uuid();
//					parkingplaceftb.setParkingplaceftbid(parkingplaceftbid);
//					result = parkingplaceftbMapper.insertSelective(parkingplaceftb);
//					if (result == 1) {
//						Integer endHours= parkingplaceftb.getFreetimebucketend().getHours();
//						Integer beginHours= parkingplaceftb.getFreetimebucketbegin().getHours();
//						Ppftbuserecord ppftbuserecord = null;
//						for (Integer k = beginHours; k <= endHours ; k++) {
//							ppftbuserecord = new Ppftbuserecord();
//							ppftbuserecord.setParkingplaceftbid(parkingplaceftbid);
//							ppftbuserecord.setPpftbuserecordid(Identities.uuid());
//							try {
//								ppftbuserecord.setPpftbtime(DateUtils.parseDate(k.toString(), "HH"));
//							} catch (ParseException e) {
//								e.printStackTrace();
//							}
//							ppftbuserecord.setIsused("0");
//							ppftbuserecordMapper.insertSelective(ppftbuserecord);
//						}
//						
//					}
//				}
//			}
		return result;
	}
	
//	public List<Parkingplacefreetime> findbyNParam(Map<String, Object> params){
//		return parkingplacefreetimeMapper.findbyNParam(params);
//	}
	
	public int deleteParkingplacefreetime(String parkingplacefreetimeid){
		int result = 0;
		result = ppftbuserecordMapper.deleteByPpftid(parkingplacefreetimeid);
		result = parkingplaceftbMapper.deleteByPpftid(parkingplacefreetimeid);
		result = parkingplacefreetimeMapper.deleteByPrimaryKey(parkingplacefreetimeid);
		return result;
	}

	public int addParkingplacefreetime(
			Parkingplacefreetime parkingplacefreetime,
			List<Parkingplaceftb> parkingplaceftbList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
