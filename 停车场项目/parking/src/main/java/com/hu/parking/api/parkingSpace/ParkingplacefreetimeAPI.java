package com.hu.parking.api.parkingSpace;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Parkingplacefreetime;
import com.hu.parking.entity.Parkingplaceftb;
import com.hu.parking.entity.Rentrecord;
import com.hu.parking.service.parkingSpace.ParkinglotsliceService;
import com.hu.parking.service.parkingSpace.ParkingplaceService;
import com.hu.parking.service.parkingSpace.ParkingplacefreetimeService;
import com.hu.parking.service.parkingSpace.RentrecordService;
import com.hu.parking.util.JsonBinder;

/**
 * 车位空闲时间
 * @author leeyuan
 *
 */
@Controller
@RequestMapping(value = "/api/parkingplacefreetime")
public class ParkingplacefreetimeAPI {

	@Autowired
	ParkingplacefreetimeService parkingplacefreetimeService;

	
	@Autowired
	ParkingplaceService parkingplaceService;

	@Autowired
	ParkinglotsliceService parkinglotsliceService;
	
	@Autowired
	RentrecordService rentrecordService;

	
	private static JsonBinder jsonBinder = JsonBinder.nonDefaultMapper();  
	
	
	
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Parkingplacefreetime> findParkingplaceft(String orduserid, String parkingplaceid,  String pflag) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("orduserid", orduserid);
		paramsMap.put("parkingplaceid", parkingplaceid);
		if ("h".equals(pflag)) {
			paramsMap.put("hflag", pflag);
		} else if ("c".equals(pflag)) {
			paramsMap.put("cflag", pflag);
		} else if ("w".equals(pflag)) {
			paramsMap.put("wflag", pflag);
		} 
		paramsMap.put("currentdate", new Date());

		List<Parkingplacefreetime> ParkingplacefreetimeList = parkingplacefreetimeService.findByParams(paramsMap);
		return ParkingplacefreetimeList;
	}

	
	
//	/**
//	 * 用户发布车位空闲时间
//	 * @param params
//	 * @return
//	 */
//	@RequestMapping(value = "/insert")
//	@ResponseBody
//	public Map<String, Object> insert(String parkingplacefreetime, String parkingplaceftbs, String freeDate) {
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		try {
//			int result = 0;
//			if (parkingplacefreetime != null && !"".equals(parkingplacefreetime) && parkingplaceftbs != null && !"".equals(parkingplaceftbs)) {
//				Parkingplacefreetime parkingplacefreetimeBean =  jsonBinder.fromJson(parkingplacefreetime, Parkingplacefreetime.class);
//				JavaType javaType = jsonBinder.contructCollectionType(List.class, Parkingplaceftb.class);
//				List<Parkingplaceftb> parkingplaceftbListBean = jsonBinder.fromJson(parkingplaceftbs, javaType);
//				String[] freeDataN = jsonBinder.fromJson(freeDate, String[].class);
//				result = parkingplacefreetimeService.addParkingplacefreetime(parkingplacefreetimeBean, parkingplaceftbListBean,freeDataN);
//			}
//			if (result == 0) {
//				resultMap.put("result", ResultCode.FAILURE);
//				resultMap.put("resultMsg", "发布车位失败！");
//			} else {
//				resultMap.put("result", ResultCode.SUCCESS);
//				resultMap.put("resultMsg", "发布车位成功！");
//			}
//		} catch (Exception e) {
//			resultMap.put("result", ResultCode.ERROR);
//			resultMap.put("resultMsg", "发布车位错误！");
//		}
//		return resultMap;
//	}
	
	/**
	 * 用户发布车位空闲时间
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(String parkingplacefreetimes) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = 0;
			if (parkingplacefreetimes != null && !"".equals(parkingplacefreetimes)) {
				JavaType parkingplacefreetimeType = jsonBinder.contructCollectionType(List.class, Parkingplacefreetime.class);
				List<Parkingplacefreetime> parkingplacefreetimeList =  jsonBinder.fromJson(parkingplacefreetimes, parkingplacefreetimeType);
				result = parkingplacefreetimeService.addParkingplacefreetime(parkingplacefreetimeList);
			}
			if (result == 0) {
				resultMap.put("result", ResultCode.FAILURE);
				resultMap.put("resultMsg", "发布车位失败！");
			} else {
				resultMap.put("result", ResultCode.SUCCESS);
				resultMap.put("resultMsg", "发布车位成功！");
			}
		} catch (Exception e) {
			resultMap.put("result", ResultCode.ERROR);
			resultMap.put("resultMsg", "发布车位错误！");
		}
		return resultMap;
	}
	
	/**
	 * 用户修改车位空闲时间
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(String parkingplacefreetime, String parkingplaceftbs, String freeDate) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = 0;
			if (parkingplacefreetime != null && !"".equals(parkingplacefreetime) && parkingplaceftbs != null && !"".equals(parkingplaceftbs)) {
				Parkingplacefreetime parkingplacefreetimeBean =  jsonBinder.fromJson(parkingplacefreetime, Parkingplacefreetime.class);
				JavaType javaType = jsonBinder.contructCollectionType(List.class, Parkingplaceftb.class);
				List<Parkingplaceftb> parkingplaceftbListBean = jsonBinder.fromJson(parkingplaceftbs, javaType);
				result = parkingplacefreetimeService.updateParkingplacefreetime(parkingplacefreetimeBean, parkingplaceftbListBean);
			}
			if (result == 0) {
				resultMap.put("result", ResultCode.FAILURE);
				resultMap.put("resultMsg", "修改车位空闲时间失败！");
			} else {
				resultMap.put("result", ResultCode.SUCCESS);
				resultMap.put("resultMsg", "修改车位空闲时间成功！");
			}
		} catch (Exception e) {
			resultMap.put("result", ResultCode.ERROR);
			resultMap.put("resultMsg", "修改车位空闲时间错误！");
		}
		return resultMap;
	}
	
	/**
	 * 删除车位空闲时间
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(String[] parkingplacefreetimeid) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = 0;
			for (int i = 0; i < parkingplacefreetimeid.length; i++) {
				result = parkingplacefreetimeService.deleteByPrimaryKey(parkingplacefreetimeid[i]);
			}
			
			if (result == 0) {
				resultMap.put("result", ResultCode.FAILURE);
				resultMap.put("resultMsg", "空闲时间删除失败！");
			}else {
				resultMap.put("result", ResultCode.SUCCESS);
				resultMap.put("resultMsg", "空闲时间删除成功！");
			}
		} catch (Exception e) {
			resultMap.put("result", ResultCode.ERROR);
			resultMap.put("resultMsg", "空闲时间删除错误！");
		}
		return resultMap;
	}

	
	/**
	 * 查询某个已发布空闲车位的详细
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/detail")
	@ResponseBody
	public Parkingplacefreetime detail(String parkingplaceid, String freedata, String parkingplacefreetimeid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("parkingplaceid", parkingplaceid);
		params.put("freedata", freedata);
		params.put("parkingplacefreetimeid", parkingplacefreetimeid);
		List<Parkingplacefreetime> parkingplacefreetimeList = parkingplacefreetimeService.findByParams(params);
		Parkingplacefreetime parkingplacefreetime = null;
		if (parkingplacefreetimeList != null && parkingplacefreetimeList.size() > 0) {
			parkingplacefreetime = parkingplacefreetimeList.get(0);
			
		}
		
		
		return parkingplacefreetime;
	}
	
//	/**
//	 * 
//	 * @param begintime 开始时间
//	 * @param endtime  结束时间
//	 * @param usehours 时长
//	 * @param minPrice 最小价格
//	 * @param maxPrice 最高价格
//	 * @param keyword 关键字
//	 * @param sortName 排序条件
//	 * @param sortOrder 排序方式
//	 * @return
//	 */
//	@RequestMapping(value = "/search1")
//	@ResponseBody
//	public List<Parkingplacefreetime> searchParkingplaceft( String parkinglotid,
//			String begintime, String endtime, Double usehours,
//			Double minPrice, Double maxPrice, String keyword, 
//			String sortName, String sortOrder, String parkingplacefreetimeid) {
//		Map<String, Object> paramsMap = new HashMap<String, Object>();
//		paramsMap.put("keyword", keyword);
//		Date nowtime = new Date();
//		if (begintime!= null && !"".equals(begintime)) {
//			Date nbegintime = DateTime.parse(begintime).toDate();
//			if (nowtime.after(nbegintime)) {
//				paramsMap.put("begintime", nowtime);
//			} else {
//				paramsMap.put("begintime", nbegintime);
//			}
//			
//		}else {
//			paramsMap.put("begintime", nowtime);
//		}
//		if (endtime!= null && !"".equals(endtime)) {
//			paramsMap.put("endtime", DateTime.parse(endtime).toDate());
//		}
//		paramsMap.put("parkinglotid", parkinglotid);
//		paramsMap.put("usehours", usehours);
//		paramsMap.put("sortName", sortName);
//		paramsMap.put("sortOrder", sortOrder);
//		paramsMap.put("maxPrice", maxPrice);
//		paramsMap.put("minPrice", minPrice);
//		paramsMap.put("parkingplacefreetimeid", parkingplacefreetimeid);
//		List<Parkingplacefreetime> ParkingplacefreetimeList = parkingplacefreetimeService.findbyNParam(paramsMap);
//		return ParkingplacefreetimeList;
//	}
	
	@RequestMapping(value = "/search")
	@ResponseBody
	public List<Parkingplacefreetime> search(String freedate, String begintime, Integer usehours,Double maxPrice,
			BigDecimal longitudeMax, BigDecimal longitudeMin, 
			BigDecimal latitudeMax, BigDecimal latitudeMin, String parkinglotid,
			String sortName, String sortOrder) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		Date nbegindatetime;
		if (freedate != null && !"".equals(freedate)) {
			if (begintime != null && !"".equals(begintime)) {
				String begindatetime = freedate+" "+begintime;
				DateTimeFormatter format = DateTimeFormat .forPattern("yyyy-MM-dd HH:mm:ss");
				nbegindatetime = DateTime.parse(begindatetime,format).toDate();
				paramsMap.put("begindatetime", nbegindatetime);
				
			}else {
				Date nowtime = new Date();
				DateTimeFormatter format = DateTimeFormat .forPattern("yyyy-MM-dd");
				nbegindatetime = DateTime.parse(freedate,format).toDate();
				if (nowtime.after(nbegindatetime)) {
					paramsMap.put("begindatetime", nowtime);
				} else {
					paramsMap.put("begindatetime", nbegindatetime);
				}	
			}
			
		}else {
			nbegindatetime = new Date();
			paramsMap.put("begindatetime", nbegindatetime);
		}
		if (usehours != null && usehours > 0) {
			DateTime dateTime = new DateTime(nbegindatetime);
			Date enddatetime = dateTime.plusHours(usehours).toDate();
			paramsMap.put("enddatetime", enddatetime);
		}
		
//		if (freedate != null && !"".equals(freedate)) {
//			Date nowtime = new Date();
//			DateTimeFormatter format = DateTimeFormat .forPattern("yyyy-MM-dd");
//			Date nbegintime = DateTime.parse(freedate,format).toDate();
//			if (nowtime.after(nbegintime)) {
//				paramsMap.put("freedate", nowtime);
//			} else {
//				paramsMap.put("freedate", nbegintime);
//			}			
//		}
//		
//		if (begintime != null && !"".equals(begintime)) {
//			DateTimeFormatter format = DateTimeFormat .forPattern("HH:mm:ss");
//			Date nbegintime = DateTime.parse(begintime,format).toDate();
//			paramsMap.put("begintime", nbegintime);
//			if (usehours > 0) {
//				DateTime dateTime = new DateTime(nbegintime);
//				Date endtime = dateTime.plusHours(usehours).toDate();
//				paramsMap.put("endtime", endtime);
//			}
//		}
		paramsMap.put("sortName", sortName);
		paramsMap.put("sortOrder", sortOrder);
		paramsMap.put("maxPrice", maxPrice);
		paramsMap.put("parkinglotid", parkinglotid);
		paramsMap.put("longitudeMax", longitudeMax);
		paramsMap.put("longitudeMin", longitudeMin);
		paramsMap.put("latitudeMax", latitudeMax);
		paramsMap.put("latitudeMin", latitudeMin);
		List<Parkingplacefreetime> ParkingplacefreetimeList = parkingplacefreetimeService.findByParams(paramsMap);
		return ParkingplacefreetimeList;
	}
	
	
	
	@RequestMapping(value = "/rent/detaile")
	@ResponseBody
	public Map<String, Object> ParkingplaceftDetaile( String parkingplacefreetimeid) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("parkingplacefreetimeid", parkingplacefreetimeid);
		List<Parkingplacefreetime> ParkingplacefreetimeList = parkingplacefreetimeService.findByParams(paramsMap);
		Parkingplacefreetime parkingplacefreetime = null;
		if (ParkingplacefreetimeList != null && ParkingplacefreetimeList.size() == 1) {
			parkingplacefreetime = ParkingplacefreetimeList.get(0);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("parkingplacefreetime", parkingplacefreetime);
		List<Rentrecord> rentrecordList = rentrecordService.findByNParams(paramsMap);
		resultMap.put("rentrecords", rentrecordList);
		return resultMap;
	}
}
