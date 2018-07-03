package com.hu.parking.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.system.RolePermMapper;
import com.hu.parking.entity.RolePerm;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.system.RolePermService;
import com.hu.parking.util.Identities;

@Service("rolePermService")
public class RolePermServiceImpl extends BaseServiceImpl<RolePerm> implements RolePermService  {
	
	@Autowired
	RolePermMapper rolePermMapper;
	
	/**
	 * 编辑角色的权限 先删除该角色的权限，再添加该角色的权限
	 * @return
	 */
	public boolean editRolePerm(String roleid, String permissionsids){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("key", "roleid");
		params.put("value", roleid);
		//删除该角色的权限
		rolePermMapper.deleteByKey(params);
		String[] permids = null;
		if (!"".equals(permissionsids.trim())) {
			permids = permissionsids.trim().split(",");
		}
		if (permids != null) {
			List<RolePerm> rolepermList = new ArrayList<RolePerm>();
			for (int i = 0; i < permids.length; i++) {
				RolePerm rolePerm = new RolePerm();
				rolePerm.setRolepermid(Identities.uuid2());
				rolePerm.setRoleid(roleid);
				rolePerm.setPermissionsid(permids[i]);
				rolePerm.setState("1");
				rolepermList.add(rolePerm);
			}
			//添加该角色的权限
			rolePermMapper.insertMultiple(rolepermList);
		}		
		return true;
	}
}
