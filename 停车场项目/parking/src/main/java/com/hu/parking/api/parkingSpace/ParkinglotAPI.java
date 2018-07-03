package com.hu.parking.api.parkingSpace;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.entity.Parkinglot;
import com.hu.parking.entity.Parkinglotslice;
import com.hu.parking.service.parkingSpace.ParkinglotService;
import com.hu.parking.service.parkingSpace.ParkinglotsliceService;

@Controller
@RequestMapping(value = "api/parkinglot")
public class ParkinglotAPI {

	@Autowired
	ParkinglotService parkinglotService;

	@Autowired
	Parkinglot parkinglot;
	
	@Autowired
	ParkinglotsliceService parkinglotsliceService;
	
	@Autowired
	Parkinglotslice parkinglotslice;
	
	

	
	/**
	 * 查询范围内的停车场
	 * @param longitudeMax
	 * @param longitudeMin
	 * @param latitudeMax
	 * @param latitudeMin
	 * @param keyword
	 * @return
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Parkinglot> list(BigDecimal longitudeMax, BigDecimal longitudeMin, 
			BigDecimal latitudeMax, BigDecimal latitudeMin, String keyword, String sortName, String sortOrder) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("longitudeMax", longitudeMax);
		paramsMap.put("longitudeMin", longitudeMin);
		paramsMap.put("latitudeMax", latitudeMax);
		paramsMap.put("latitudeMin", latitudeMin);
		paramsMap.put("keyword", keyword);
		paramsMap.put("sortName", sortName);
		paramsMap.put("sortOrder", sortOrder);
		List<Parkinglot> parkinglots = parkinglotService.findByParams(paramsMap);
		return parkinglots;
	}
	
	/**
	 * 
	 * @param parkinglotid
	 * @return
	 */
	@RequestMapping(value = "/detaile")
	@ResponseBody
	public Parkinglot detaile(String parkinglotid) {
		Parkinglot parkinglot = parkinglotService.selectByPrimaryKey(parkinglotid);
		return parkinglot;
	}
	
	
	
	/**
	 * 模糊查询停车场信息
	 * @param parkingLotName
	 * @return
	 */
	@RequestMapping(value = "/list/find")
	@ResponseBody
	public List<Map<String, Object>> findParkinglotByName(String parkingLotName) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("parkingLotName", parkingLotName);
		List<Parkinglot> parkinglotList = parkinglotService.findByParams(paramsMap);
		List<Map<String, Object>> parkinglotList2 = new ArrayList<Map<String,Object>>();
		if (parkinglotList != null && parkinglotList.size() >0) {
			String[] parkinglotids = new String[parkinglotList.size()];
			for (int i = 0; i < parkinglotList.size(); i++) {
				parkinglotids[i] = parkinglotList.get(i).getParkinglotid();
			}
			Map<String, Object> paramsMapOfslice = new HashMap<String, Object>();
			paramsMapOfslice.put("parkinglotids", parkinglotids);
			List<Parkinglotslice> parkinglotsliceList = parkinglotsliceService.findByParams(paramsMapOfslice);
			Map<String, Object> resultMap;
			for (int i = 0; i < parkinglotList.size(); i++) {
				Parkinglot parkinglot = parkinglotList.get(i);
				resultMap = new HashMap<String, Object>();
				resultMap.put("parkinglotid", parkinglot.getParkinglotid());
				resultMap.put("parkinglotname", parkinglot.getParkinglotname());
				resultMap.put("parkinglotaddress", parkinglot.getParkinglotaddress());
				List<String[]> parkinglotsliceInfos = new ArrayList<String[]>();
				if (parkinglotsliceList != null && parkinglotsliceList.size() > 0) {
					String[] sliceinfos;
					for (int j = 0; j < parkinglotsliceList.size(); j++) {
						Parkinglotslice parkinglotslice = parkinglotsliceList.get(j);
						if (parkinglotslice.getParkinglotid().equals(parkinglot.getParkinglotid())) {
							sliceinfos = new String[2];
							sliceinfos[0] = parkinglotslice.getParkinglotsliceid().toString();
							sliceinfos[1] = parkinglotslice.getSlicename();
							parkinglotsliceInfos.add(sliceinfos);
						}
						
					}
				}
				resultMap.put("parkinglotsliceInfos", parkinglotsliceInfos);
				parkinglotList2.add(resultMap);
			}
		}
		return parkinglotList2;
	}

	/**
	 * 查询某停车场可用的停车位及空闲时间
	 * @param parkinglotid
	 * @param freedate
	 * @return
	 */
	@RequestMapping(value = "/parkingplacefreetime/list")
	@ResponseBody
	public Parkinglot findParkingplaceft(String parkinglotid, String freedate, Double approvalTime,
			Double minPrice, Double maxPrice) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("parkinglotid", parkinglotid);
		paramsMap.put("useState", "2");
		paramsMap.put("approvalTime", approvalTime);
		paramsMap.put("minPrice", minPrice);
		paramsMap.put("maxPrice", maxPrice);
		if (freedate != null) {
			paramsMap.put("freedate",DateTime.parse(freedate).toDate());
		}
		Parkinglot parkinglot = null;
		List<Parkinglot> parkinglots = parkinglotService.findParkingplaceft(paramsMap);
		if (parkinglots != null && parkinglots.size() > 0) {
			parkinglot = parkinglots.get(0);
		}
		return parkinglot;
	}
	
	
	
	
	
	
}
