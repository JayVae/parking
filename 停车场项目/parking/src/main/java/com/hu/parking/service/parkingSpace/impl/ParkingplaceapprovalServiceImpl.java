package com.hu.parking.service.parkingSpace.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.parkingSpace.ParkinglotMapper;
import com.hu.parking.dao.parkingSpace.ParkinglotsliceMapper;
import com.hu.parking.dao.parkingSpace.ParkingplaceMapper;
import com.hu.parking.dao.parkingSpace.ParkingplaceapprovalMapper;
import com.hu.parking.entity.Parkinglot;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Parkingplaceapproval;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.parkingSpace.ParkingplaceapprovalService;

@Service("parkingplaceapprovalService")
public class ParkingplaceapprovalServiceImpl extends BaseServiceImpl<Parkingplaceapproval> implements ParkingplaceapprovalService {
	
	@Autowired
	ParkingplaceapprovalMapper parkingplaceapprovalMapper;
	
	@Autowired
	ParkingplaceMapper parkingplaceMapper;
	
	@Autowired
	ParkinglotMapper parkinglotMapper;
	
	@Autowired
	ParkinglotsliceMapper parkinglotsliceMapper;
	
	public int approvalid(String propertyuserid, String parkingplaceapprovalid, String approvalstate){
		int result = 0;
		Parkingplaceapproval parkingplaceapproval = new Parkingplaceapproval();
		parkingplaceapproval.setParkingplaceapprovalid(parkingplaceapprovalid);
		parkingplaceapproval.setApprovaltime(new Date());
		parkingplaceapproval.setPropertyuserid(propertyuserid);
		parkingplaceapproval.setApprovalstate(approvalstate);
		result = parkingplaceapprovalMapper.updateByPrimaryKeySelective(parkingplaceapproval);
		if ("2".equals(approvalstate)) {
			Parkingplaceapproval parkingplaceapprovalN = parkingplaceapprovalMapper.selectByPrimaryKey(parkingplaceapprovalid);
			Parkingplace parkingplace = new Parkingplace();
			parkingplace.setParkingplaceid(parkingplaceapprovalN.getParkingplaceid());
			parkingplace.setOrduserid(parkingplaceapprovalN.getOrduserid());
			result = parkingplaceMapper.updateByPrimaryKeySelective(parkingplace);
			
			String parkinglotid = parkinglotsliceMapper.selectByPrimaryKey(parkingplace.getParkinglotsliceid()).getParkinglotid();
			
			Parkinglot parkinglot = parkinglotMapper.selectByPrimaryKey(parkinglotid);
			Parkinglot parkinglotNew = new Parkinglot();
			parkinglotNew.setParkinglotid(parkinglotid);
			parkinglot.setParkingplacenum(parkinglot.getParkingplacenum()+1);
			result =  parkinglotMapper.updateByPrimaryKeySelective(parkinglotNew);
		}
		return result;
	}
}
