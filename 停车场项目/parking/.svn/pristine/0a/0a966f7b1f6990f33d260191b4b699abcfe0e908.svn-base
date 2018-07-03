package com.hu.parking.controller.parkingSpace;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.common.Page;
import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Parkingplace;
import com.hu.parking.entity.Parkingplaceapproval;
import com.hu.parking.service.parkingSpace.ParkingplaceService;
import com.hu.parking.service.parkingSpace.ParkingplaceapprovalService;
import com.hu.parking.service.system.RoleService;

/**
 * 车位审核
 * @author leeyuan
 *
 */
@Controller
@RequestMapping("/parkingplaceapproval")
public class ParkingplaceapprovalController {

	@Autowired
	ParkingplaceapprovalService parkingplaceapprovalService;

	@Autowired
	Parkingplaceapproval parkingplaceapproval;
	
	
	@RequestMapping(value = "")
	public String parkingplaceList() {
		return "parkingSpace/parkingplaceList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		page.getParams().get("parking");
		return parkingplaceapprovalService.pagedByParams(page);
	}

	@RequestMapping(value = "/info")
	public String info(String opt,Model model) {
		model.addAttribute("opt", opt);
		if ("add".equals(opt)) {
			return "/parkingSpace/parkingplaceInfoAdd";
		}
		return "/parkingSpace/parkingplaceInfo";
	}

	
	
	@RequestMapping(value = "/{parkingplaceapprovalid}/edit")
	@ResponseBody
	public Parkingplaceapproval edit(@PathVariable("parkingplaceid") String parkingplaceapprovalid) {
		return parkingplaceapprovalService.selectByPrimaryKey(parkingplaceapprovalid);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Parkingplaceapproval parkingplaceapproval) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (parkingplaceapprovalService.updateByPrimaryKeySelective(parkingplaceapproval) ==1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "审核成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "审核失败！");
		}
		return result;
	}
	
	
	
}
