package com.hu.parking.controller.system;

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
import com.hu.parking.entity.Manager;
import com.hu.parking.service.system.ManagerService;
import com.hu.parking.service.system.RoleService;
import com.hu.parking.service.system.impl.ManagerServiceImpl;
import com.hu.parking.service.system.impl.RoleServiceImpl;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@Autowired
	Manager manager;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = "")
	public String managerList() {
		return "system/managerList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		return managerService.pagedByParams(page);
	}

	@RequestMapping(value = "/info")
	public String info(String opt,Model model) {
		model.addAttribute("opt", opt);
		return "/system/managerInfo";
	}

	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(Manager manager) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (managerService.addManager(manager)) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "添加管理员成功！");
		}else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "添加管理员失败！");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/{managerid}/edit")
	@ResponseBody
	public Manager edit(@PathVariable("managerid") String managerid) {
		return managerService.selectByPrimaryKey(managerid);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Manager manager) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (managerService.updateManager(manager)) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改管理员成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "修改管理员失败！");
		}
		return result;
	}
	
	@RequestMapping(value = "/{managerid}/view")
	@ResponseBody
	public Manager view(@PathVariable("managerid") String managerid) {
		manager = managerService.selectByPrimaryKey(managerid);
		return manager;
	}
	
	@RequestMapping(value = "/{managerid}/delete")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("managerid") String managerid) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = managerService.deleteByPrimaryKey(managerid);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "删除管理员成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该管理员已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/isexist")
	@ResponseBody
	public String isExist(String loginname, String managerid) {
		int result = managerService.findByKeyCount("loginname", loginname,"managerid", managerid);
		if (result == 0) {
			return ResultCode.UNEXIST;
		} else {
			return ResultCode.EXIST;
		}
	}
	
	
	
	
}
