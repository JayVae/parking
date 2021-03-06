package com.hu.parking.service.parkingSpace.impl;

import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.Duration;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.ParkingplacefreetimeMapper;
import com.hu.parking.dao.RentrecordMapper;
import com.hu.parking.entity.Parkingplacefreetime;
import com.hu.parking.entity.Rentrecord;

@Service("computeFeeService")
public class ComputeFeeServiceImpl {

	@Autowired
	RentrecordMapper rentrecordMapper;
	
	@Autowired
	ParkingplacefreetimeMapper parkingplacefreetimeMapper;
	
	public Double computfee(String rentrecordid){
		Double result = 0.0;
		Rentrecord rentrecord = rentrecordMapper.selectByPrimaryKey(rentrecordid);
		Parkingplacefreetime parkingplacefreetime = parkingplacefreetimeMapper.selectByPrimaryKey(rentrecord.getParkingplacefreetimeid());
		//预约开始时间
		Date appointmentbegintime = rentrecord.getAppointmentbegintime();
		//预约结束时间
		Date appointmentendtime = rentrecord.getAppointmentendtime();
		//实际开始时间
		Date factbegintime = rentrecord.getFactbegintime();
		//实际结束时间
		Date factendtime = new Date();
		
		
		//空闲时间开始时间
		Date freetimebucketbegin = parkingplacefreetime.getFreetimebucketbegin();
		//空闲时间结束时间
		Date freetimebucketend = parkingplacefreetime.getFreetimebucketend();
		
		//正时时长
		int pfreemin = 0;
		if (new DateTime(factbegintime).isBefore(new DateTime(appointmentbegintime))) {
			pfreemin = new Period(new DateTime(factbegintime), new DateTime(factendtime), PeriodType.minutes()).getMinutes();
		}else {
			pfreemin = new Period(new DateTime(appointmentbegintime), new DateTime(factendtime), PeriodType.minutes()).getMinutes();
		}
		int pfreehours = pfreemin/60;
		if (pfreemin % 60 >= 15) {
			pfreehours = pfreehours + 1;
		}
		//超时时长（分钟）
		int pexceedmin = new Period(new DateTime(appointmentendtime), new DateTime(factendtime), PeriodType.minutes()).getMinutes();
		int pexceedhours = 0;
		if (pexceedmin > 0) {
			pexceedhours = pexceedmin/60;
			if (pexceedmin % 60 >= 15) {
				pexceedhours++;
			}
		}
		
		//节时时长（分钟）
		int pomitmin = new Period(new DateTime(factendtime), new DateTime(appointmentendtime), PeriodType.minutes()).getMinutes();
		int pomithours = 0;
		if (pomitmin > 0) {
			pomithours = pomitmin/60;
			if (pomitmin % 60 >= 15) {
				pomithours++;
			}
			pfreehours = pfreehours - pomithours;
		}
		
		//罚时时长（分钟）
		int ppunishmin= new Period(new DateTime(freetimebucketend), new DateTime(factendtime), PeriodType.minutes()).getMinutes();
		int punishhours = 0;
		if (ppunishmin > 0) {
			punishhours = ppunishmin/60;
			if (punishhours % 60 >= 15) {
				punishhours++;
			}
			//超时时长
			pexceedmin = new Period(new DateTime(appointmentendtime), new DateTime(freetimebucketend), PeriodType.minutes()).getMinutes();
		}
		
		//正时类型：
		//1: 单位价格/单位时间
		//2: 起步价格/起步时间+单位价格/单位时间
		//3: 固定费用：用单位价格代替
		String ruletype = parkingplacefreetime.getRuletype();
		
		//单位价格
		Double unitprice = parkingplacefreetime.getUnitprice();
		//单位时长
		Float unittimelong = parkingplacefreetime.getUnittimelong();
		//正时费用
		Double freetimeCost = 0.0;
		if ("1".equals(ruletype)) {
			freetimeCost = pfreehours/unittimelong*unitprice;
		}else if ("2".equals(ruletype)) {
			//起步价格
			Double startprice = parkingplacefreetime.getStartprice();
			//起步时长
		    Float starttimelong = parkingplacefreetime.getStarttimelong();
		    Double surplustimelong = (double) (pfreehours -starttimelong);
		    if (surplustimelong > 0) {
		    	freetimeCost = surplustimelong/unittimelong*unitprice + startprice;
			}else {
				freetimeCost = startprice;
			}
		}else if ("3".equals(ruletype)) {
			freetimeCost = unitprice;
		}
		
		//节时费用
		Double omitCost = 0.0;
		//节时费用类型
		//1：固定费用
		//2: 费用比例
		String omitType = "1";
		Double omitPrice = 3.0;
		if ("1".equals(omitType)) {
			omitCost = omitPrice;
		} else if ("2".equals(omitType)) {
			omitCost = pomithours/unittimelong*unitprice*omitPrice;
		}
		
		//超时费用
		Double exceedTimeCost = 0.0;
		//超时费用类型
		//1：固定费用
		//2: 费用比例
		String exceedType = "1";
		Double exceedPrice = 3.0;
		if ("1".equals(exceedType)) {
			exceedTimeCost = exceedPrice;
		} else if ("2".equals(exceedType)) {
			exceedTimeCost = pexceedhours/unittimelong*unitprice*exceedPrice;
		}
		
		//罚时类型
		//1:罚时单价/罚时单位时间
		//2:倍数  罚时单价代替
		//3:整体金额  罚时单价代替
		String punishType = parkingplacefreetime.getPunishtype();
		//罚时单价
		Double punishunitprice = parkingplacefreetime.getPunishunitprice();
		//罚时单位时长
		Float punishunittimelong = parkingplacefreetime.getPunishunittimelong();
		//罚时费用
		Double punishCost = 0.0;
		if (punishhours > 0) {
			if ("1".equals(punishType)) {
				punishCost = punishhours/punishunittimelong * punishunitprice;
			}else if("2".equals(punishType)) {
				punishCost = punishhours/punishunittimelong * punishunitprice*unitprice;
			}else if("3".equals(punishType)) { 
				punishCost = punishunitprice;
			}
		}
		result = freetimeCost + omitCost +exceedTimeCost + punishCost;
		
		return result;
	}
}
