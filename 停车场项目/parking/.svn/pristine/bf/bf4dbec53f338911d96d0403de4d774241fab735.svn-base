package com.hu.parking.api.parkingSpace;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Parkinglotslice;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Usercar;
import com.hu.parking.service.parkingSpace.ParkinglotsliceService;
import com.hu.parking.service.parkingSpace.ParkingplaceService;
import com.hu.parking.service.parkingSpace.UsercarService;
import com.hu.parking.util.Identities;

@Controller
@RequestMapping("/api/usercar")
public class UsercarAPI {

	@Autowired
	UsercarService usercarService;
	
	
//	/**
//	 * 
//	 * @param params
//	 * @return
//	 */
//	@RequestMapping(value = "/list")
//	@ResponseBody
//	public List<Parkinglotslice> list(String parkinglotid) {
//		Map<String, Object> paramsMap = new HashMap<String, Object>();
//		paramsMap.put("parkinglotid", parkinglotid);
//		List<Parkinglotslice> parkinglotsliceList = parkinglotsliceService.findByParams(paramsMap);
//		List<Parkingplace> parkingplaceList = parkingplaceService.findByParams(paramsMap);
//		for (int i = 0; i < parkinglotsliceList.size(); i++) {
//			Parkinglotslice parkinglotslice = parkinglotsliceList.get(i);
//			List<Parkingplace> parkingplaceListNew = new ArrayList<Parkingplace>();
//			for (int j = 0; j < parkingplaceList.size(); j++) {
//				Parkingplace parkingplace = parkingplaceList.get(j);
//				if (parkingplace.getParkinglotsliceid().equals(parkinglotslice.getParkinglotsliceid())) {
//					parkingplaceListNew.add(parkingplace);
//				}
//			}
//			parkinglotslice.setParkingplaceList(parkingplaceListNew);
//		}
//		return parkinglotsliceList;
//	}
//	
	/**
	 * 查询用户自己的车辆
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/user/list")
	@ResponseBody
	public List<Usercar> orduserparkingplace(String orduserid) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("orduserid", orduserid);
		List<Usercar> usercarList = usercarService.findByParams(paramsMap);
		return usercarList;
	}
	
	/**
	 * 用户添加车辆
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> inset(Usercar usercar) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String usercarid = Identities.uuid();
		usercar.setUsercarid(usercarid);
		usercar.setRegtime(new Date());
		int result = 0;
		result = usercarService.insertSelective(usercar);
		if (result == 0) {
			resultMap.put("result", ResultCode.FAILURE);
			resultMap.put("resultMsg", "添加用户车辆失败！");
		}else {
			resultMap.put("result", ResultCode.SUCCESS);
			resultMap.put("resultMsg", "添加用户车辆成功！");
			resultMap.put("usercarid", usercarid);
		}
		return resultMap;
	}
	
	

	
	
	
}
