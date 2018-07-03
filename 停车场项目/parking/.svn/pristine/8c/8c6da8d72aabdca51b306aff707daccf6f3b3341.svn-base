package com.hu.parking.service.system.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hu.parking.common.Encryption;
import com.hu.parking.dao.system.AccountRoleMapper;
import com.hu.parking.dao.system.ManagerMapper;
import com.hu.parking.entity.AccountRole;
import com.hu.parking.entity.Manager;
import com.hu.parking.service.base.BaseServiceImpl;
import com.hu.parking.service.system.ManagerService;
import com.hu.parking.util.Identities;


@Service("managerService")
public class ManagerServiceImpl extends BaseServiceImpl<Manager> implements ManagerService  {
	
		@Autowired
		ManagerMapper managerMapper;
		
		@Autowired
		AccountRoleMapper accountRoleMapper;
		
		
		
		/**
		 * 先增加管理员信息，在增加管理员角色信息
		 * @param manager
		 * @return
		 */
		public boolean addManager(Manager manager){
			Encryption encryption = new Encryption();
			manager.setManagerid(Identities.uuid2());
			manager.setRegistertime(new Date());
			manager.setLoginpwd(encryption.encryptionPwd(manager.getLoginpwd()));//对密码进行加密
			managerMapper.insert(manager);
			AccountRole accountRole = new AccountRole();
			accountRole.setAccountid(manager.getManagerid());
			accountRole.setAccountroleid(Identities.uuid2());
			accountRole.setRoleid(manager.getRoleid());			
			accountRoleMapper.insert(accountRole);
			return true;
		}
		
		public boolean updateManager(Manager manager){
			managerMapper.updateByPrimaryKeySelective(manager);
			AccountRole accountRole = new AccountRole();
			accountRole.setAccountid(manager.getManagerid());
			accountRole.setAccountroleid(manager.getAccountroleid());
			accountRole.setRoleid(manager.getRoleid());			
			accountRoleMapper.updateByPrimaryKeySelective(accountRole);
			return true;
		}
}
