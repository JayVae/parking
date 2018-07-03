package com.hu.parking.service.system.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.dao.system.PermissionsMapper;
import com.hu.parking.entity.Permissions;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.system.PermissionsService;

@Service("permissionsService")
public class PermissionsServiceImpl extends BaseServiceImpl<Permissions> implements PermissionsService {
	
	@Autowired
	PermissionsMapper permissionsMapper;
	
	/**
	 * 把数据转变为Tree结构
	 */
	public List<Permissions> dataToTree(List<Permissions> permissionsList,Integer startLevel){
		List<Permissions> permissionsTree = new ArrayList<Permissions>();
		for (int i=0; i<permissionsList.size(); i++) {
			Permissions permissions = permissionsList.get(i);			
			for (int j=0; j<permissionsList.size(); j++) {
				Permissions permissions1 = permissionsList.get(j);
				if (permissions.getPermissionsid().equals(permissions1.getParentid())) {
					if (permissions.getChildren() != null) {
						List<Permissions> children = permissions.getChildren();
						children.add(permissions1);
						permissions.setChildren(children);
					}else {
						List<Permissions> children = new ArrayList<Permissions>();
						children.add(permissions1);
						permissions.setChildren(children);
					}					
				}
			}
			if (permissions.getLevel() == startLevel) {
				permissionsTree.add(permissions);
			}			
		}	
		return permissionsTree;
	}
	
	public List<Permissions> findByRole(Map<String, Object> params){
		return permissionsMapper.findByRole(params);
	}
}
