package com.hu.parking.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Permissions;
import com.hu.parking.service.system.PermissionsService;
import com.hu.parking.service.system.impl.PermissionsServiceImpl;

@Controller
@RequestMapping(value = "/permissions")
public class PermissionsController {

	@Autowired
	PermissionsService permissionsService;

	@Autowired
	Permissions permissions;

	@RequestMapping(value = "")
	public String permissionsList() {
		return "system/permissionsList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Permissions> list(String type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("parentid", '1');
		params.put("level", 3);
		params.put("type", type);
		List<Permissions> permissionsList = permissionsService.findByParams(params);			
		return permissionsService.dataToTree(permissionsList, 0);
	}

	@RequestMapping(value = "/info")
	public String info(String opt, Model model) {
		model.addAttribute("opt",opt);
		return "/system/permissionsInfo";
	}

	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(Permissions permissions) {
		Map<String, Object> result = new HashMap<String, Object>();
		permissionsService.insert(permissions);
		result.put("result", ResultCode.SUCCESS);
		result.put("resultMsg", "添加权限成功！");
		return result;
	}

	
	@RequestMapping(value = "/{permissionsid}/edit")
	@ResponseBody
	public Permissions edit(@PathVariable("permissionsid") String permissionsid) {
		return permissionsService.selectByPrimaryKey(permissionsid);
	}

	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Permissions permissions) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = permissionsService.updateByPrimaryKeySelective(permissions);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改权限成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该权限已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/{permissionsid}/view")
	@ResponseBody
	public Permissions view(@PathVariable("permissionsid") String permissionsid) {
		permissions = permissionsService.selectByPrimaryKey(permissionsid);
		return permissions;
	}

	
	@RequestMapping(value = "/{permissionsid}/delete")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("permissionsid") String permissionsid) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = permissionsService.deleteByPrimaryKey(permissionsid);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "删除权限成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该权限已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/isexist")
	@ResponseBody
	public String isExist(String title, String permissionsid) {
		int result = 1;
		if ("".equals(title) || title == null) {
			result = permissionsService.findByKeyCount("permissionsid", permissionsid);
		}else {
			result = permissionsService.findByKeyCount("title", title,"permissionsid", permissionsid);
		}		
		if (result == 0) {
			return ResultCode.UNEXIST;
		} else {
			return ResultCode.EXIST;
		}
	}		
}
