package com.hu.parking.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.common.Page;
import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Permissions;
import com.hu.parking.entity.Role;
import com.hu.parking.entity.RolePerm;
import com.hu.parking.service.system.PermissionsService;
import com.hu.parking.service.system.RolePermService;
import com.hu.parking.service.system.RoleService;
import com.hu.parking.service.system.impl.PermissionsServiceImpl;
import com.hu.parking.service.system.impl.RolePermServiceImpl;
import com.hu.parking.service.system.impl.RoleServiceImpl;
import com.hu.parking.util.Identities;

@Controller
@RequestMapping(value = "/role")
public class RoleController {

	@Autowired
	RoleService roleService;

	@Autowired
	Role role;
	
	@Autowired
	RolePermService rolePermService;
	
	@Autowired
	PermissionsService permissionsService;
	
	@RequestMapping(value = "")
	public String roleList() {
		return "system/roleList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		return roleService.pagedByParams(page);
	}

	@RequestMapping(value = "/roles")
	@ResponseBody
	public List<Role> roles(String type, String state) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type",	type);
		params.put("state",	state);
		List<Role> roles = roleService.findByParams(params);
		return roles;
	}
	
	@RequestMapping(value = "/info")
	public String info() {
		return "system/roleInfo";
	}
	
	@RequestMapping(value = "/perminfo")
	public String perminfo() {
		return "system/rolepermInfo";
	}
		
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(Role role) {
		Map<String, Object> result = new HashMap<String, Object>();
		role.setRoleid(Identities.uuid2());
		roleService.insert(role);
		result.put("result", ResultCode.SUCCESS);
		result.put("resultMsg", "添加角色成功！");
		return result;
	}
	
	@RequestMapping(value = "/{roleid}/edit")
	@ResponseBody
	public Role edit(@PathVariable("roleid") String roleid) {
		return roleService.selectByPrimaryKey(roleid);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Role role) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = roleService.updateByPrimaryKeySelective(role);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改角色权限成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该角色权限已不存在！");
		}
		return result;
	}
	
	
	
	@RequestMapping(value = "/{roleid}/view")
	@ResponseBody
	public Role view(@PathVariable("roleid") String roleid) {
		role = roleService.selectByPrimaryKey(roleid);
		return role;
	}
	
	@RequestMapping(value = "/{roleid}/delete")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("roleid") String roleid) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = roleService.deleteByPrimaryKey(roleid);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "删除角色成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该角色已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/isexist")
	@ResponseBody
	public String isExist(String rolename, String roleid) {
		int result = roleService.findByKeyCount("rolename", rolename,"roleid", roleid);
		if (result == 0) {
			return ResultCode.UNEXIST;
		} else {
			return ResultCode.EXIST;
		}
	}
	
	@RequestMapping(value = "/{roleid}/permissions")
	@ResponseBody
	public List<Permissions> roleperm(@PathVariable("roleid") String roleid, String type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("state", "1");
		params.put("level", 3);
		List<Permissions> permissionsList = permissionsService.findByParams(params);
		List<RolePerm> rolePermList = rolePermService.findByKey("roleid", roleid);
		for (Permissions permissions : permissionsList) {
			for (RolePerm rolePerm : rolePermList) {
				if (permissions.getPermissionsid().equals(rolePerm.getPermissionsid())) {
					if (permissions.getLevel() == 3) {
						permissions.setChecked(true);
					}					
				}
			}
		}
		return permissionsService.dataToTree(permissionsList, 0);
	}
	
	@RequestMapping(value = "/permissions/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> rolepermUpdate(String roleid, String permissionsids) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (rolePermService.editRolePerm(roleid, permissionsids)) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改角色权限成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "修改角色权限失败！");
		}
		return result;
	}
}
