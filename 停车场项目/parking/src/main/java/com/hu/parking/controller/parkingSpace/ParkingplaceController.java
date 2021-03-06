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
import com.hu.parking.service.parkingSpace.ParkingplaceService;
import com.hu.parking.service.system.RoleService;
import com.hu.parking.util.Identities;

@Controller
@RequestMapping("/parkingplace")
public class ParkingplaceController {

	@Autowired
	ParkingplaceService parkingplaceService;

	@Autowired
	Parkingplace parkingplace;
	
	
	@RequestMapping(value = "")
	public String parkingplaceList() {
		return "parkingSpace/parkingplaceList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		page.getParams().get("parking");
		return parkingplaceService.pagedByParams(page);
	}

	@RequestMapping(value = "/info")
	public String info(String opt,Model model) {
		model.addAttribute("opt", opt);
		if ("add".equals(opt)) {
			return "/parkingSpace/parkingplaceInfoAdd";
		}
		return "/parkingSpace/parkingplaceInfo";
	}

	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(Parkingplace parkingplace, String perfixNo, String suffixNo, int num, int startNo) {
		String parkingplaceno = "";
		for (int i = 0; i < num; i++) {
			parkingplaceno = perfixNo + String.valueOf(startNo + i)+suffixNo;
			parkingplace.setParkingplaceno(parkingplaceno);
			parkingplace.setParkingplaceid(Identities.uuid());
			parkingplaceService.insertSelective(parkingplace);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", ResultCode.SUCCESS);
		result.put("resultMsg", "添加车位成功！");
		return result;
	}
	
	@RequestMapping(value = "/{parkingplaceid}/edit")
	@ResponseBody
	public Parkingplace edit(@PathVariable("parkingplaceid") String parkingplaceid) {
		return parkingplaceService.selectByPrimaryKey(parkingplaceid);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Parkingplace parkingplace) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (parkingplaceService.updateByPrimaryKeySelective(parkingplace) ==1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改车位成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "修改车位失败！");
		}
		return result;
	}
	
	@RequestMapping(value = "/{parkingplaceid}/view")
	@ResponseBody
	public Parkingplace view(@PathVariable("parkingplaceid") String parkingplaceid) {
		parkingplace = parkingplaceService.selectByPrimaryKey(parkingplaceid);
		return parkingplace;
	}
	
	@RequestMapping(value = "/{parkingplaceid}/delete")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("parkingplaceid") String parkingplaceid) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = parkingplaceService.deleteByPrimaryKey(parkingplaceid);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "删除车位成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该车位已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/isexist")
	@ResponseBody
	public String isExist(String loginname, String parkingplaceid) {
		int result = parkingplaceService.findByKeyCount("loginname", loginname,"parkingplaceid", parkingplaceid);
		if (result == 0) {
			return ResultCode.UNEXIST;
		} else {
			return ResultCode.EXIST;
		}
	}
	
}
