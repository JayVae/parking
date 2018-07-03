package com.hu.parking.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.entity.Manager;
import com.hu.parking.entity.Permissions;
import com.hu.parking.entity.User;
import com.hu.parking.service.system.PermissionsService;
import com.hu.parking.service.system.UserService;
import com.hu.parking.service.system.impl.PermissionsServiceImpl;
import com.hu.parking.service.system.impl.RoleServiceImpl;
import com.hu.parking.service.system.impl.UserServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PermissionsService permissionsService;

	@Autowired
	RoleServiceImpl rolesService;
	
	
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		Map<String, Object> params = new HashMap<String, Object>();
		List<User> users = userService.findByParams(params);
		for (User user1 : users) {
			System.out.println("userList:find(params):"+ user1.getLoginname());
		}
		model.addAttribute("serverTime", formattedDate );
		return "welcome";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index() {
		
		return "home";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test( Model model) {
		
		return "test";
	}
	
	@RequestMapping(value = "/menuTree")
	@ResponseBody
	public List<Permissions> menuTree() {
		Map<String, Object> params = new HashMap<String, Object>();
		Subject currentUser = SecurityUtils.getSubject();
		Manager manager = (Manager)currentUser.getPrincipal();
		params.put("roleid", manager.getRoleid());
		List<Permissions> permissionlList = permissionsService.findByRole(params);
		List<Permissions> permissionsTree = new ArrayList<Permissions>();
		for (int i=0; i<permissionlList.size(); i++) {
			Permissions permissions = permissionlList.get(i);
			if (permissions.getLevel() == 1) {
				for (int j=0; j<permissionlList.size(); j++) {
					Permissions permissions1 = permissionlList.get(j);
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
				permissionsTree.add(permissions);
			}
		}		
		return permissionsTree;
	}
	
}
