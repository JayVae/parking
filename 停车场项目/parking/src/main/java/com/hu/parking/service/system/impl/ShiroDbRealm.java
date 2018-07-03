package com.hu.parking.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.hu.parking.dao.system.ManagerMapper;
import com.hu.parking.dao.system.PermissionsMapper;
import com.hu.parking.dao.system.RoleMapper;
import com.hu.parking.dao.system.UserMapper;
import com.hu.parking.entity.Manager;
import com.hu.parking.entity.Permissions;
import com.hu.parking.entity.Role;

public class ShiroDbRealm extends AuthorizingRealm {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
//	private static final int SALT_SIZE = 8;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private ManagerMapper managerMapper;

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private PermissionsMapper permissionsMapper;

	@Autowired
	private SimpleCredentialsMatcher customCredentialsMatcher;
	
	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		Manager manager = (Manager) principals.getPrimaryPrincipal();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("accountid", manager.getManagerid());
		List<Role> roles = roleMapper.findByAccount(params);
		Map<String, Object> paramsPer = new HashMap<String, Object>();
		paramsPer.put("roleid", roles.get(0).getRoleid());
		List<Permissions> permissionsList = permissionsMapper.findByRole(params);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 基于Role的权限信息
		info.addRole(roles.get(0).getRolename());
		for (int i = 0; i < permissionsList.size(); i++) {
			// 基于Permission的权限信息
			info.addStringPermission(permissionsList.get(i).getPermstr());
		}
		return info;
	}

	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String username = (String) token.getPrincipal(); // 得到用户名
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginnameOfLogin", username);
		List<Manager> managerList = managerMapper.findByParams(params);
		if (managerList != null && managerList.size() > 0) {
			Manager manager = managerList.get(0);
			if ("0".equals(manager.getState())) {
				throw new DisabledAccountException();// 账户不可用
			}
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			session.setAttribute("manager", manager);
			return new SimpleAuthenticationInfo(manager, manager.getLoginpwd(), getName());
		} else {
			throw new UnknownAccountException(); // 用户名错误
		}
	}

	

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		// 自定义密码验证
		setCredentialsMatcher(customCredentialsMatcher);
	}

}
