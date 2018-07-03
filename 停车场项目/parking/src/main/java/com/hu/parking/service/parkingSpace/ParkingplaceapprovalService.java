package com.hu.parking.service.parkingSpace;

import com.hu.parking.entity.Parkingplaceapproval;
import com.hu.parking.service.base.BaseService;

public interface ParkingplaceapprovalService extends BaseService<Parkingplaceapproval> {
	public int approvalid(String propertyuserid, String parkingplaceapprovalid, String approvalstate);
}
