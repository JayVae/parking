package com.hu.parking.controller.parkingSpace;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.common.Page;
import com.hu.parking.entity.Parkingplacefreetime;
import com.hu.parking.service.parkingSpace.ParkingplacefreetimeService;

@Controller
@RequestMapping(value = "/parkingplacefreetime")
public class ParkingPlacefreetimeController {

	@Autowired
	ParkingplacefreetimeService parkingplacefreetimeService;
	
	@Autowired
	Parkingplacefreetime parkingplacefreetime;
	
	
	

	@RequestMapping(value = "")
	public String parkinglotList() {
		return "parkingSpace/parkinglotList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		return parkingplacefreetimeService.pagedByParams(page);
	}

	
}
