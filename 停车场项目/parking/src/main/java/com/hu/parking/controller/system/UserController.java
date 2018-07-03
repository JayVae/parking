package com.hu.parking.controller.system;

import java.util.Date;
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
import com.hu.parking.entity.User;
import com.hu.parking.service.system.UserService;
import com.hu.parking.service.system.impl.UserServiceImpl;
import com.hu.parking.util.Identities;

@Controller
@RequestMapping(value="/user")

public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	User user;

	@RequestMapping(value = "")
	public String userList() {
		return "system/userList";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Page page) {
		return userService.pagedByParams(page);
	}
	
	@RequestMapping(value = "/users")
	@ResponseBody
	public List<User> lists(String mobile) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mobile", mobile);
		return userService.findByParams(params);
	}

	@RequestMapping(value = "/info")
	public String info() {
		return "/system/userInfo";
	}

	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		user.setUserid(Identities.uuid2());
		user.setRegistertime(new Date());
		userService.insert(user);
		result.put("result", ResultCode.SUCCESS);
		result.put("resultMsg", "添加用户成功！");
		return result;
	}

	
	@RequestMapping(value = "/{userid}/edit")
	@ResponseBody
	public User edit(@PathVariable("userid") String userid) {
		return userService.selectByPrimaryKey(userid);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = userService.updateByPrimaryKeySelective(user);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "修改用户成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该用户已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/{userid}/view")
	@ResponseBody
	public User view(@PathVariable("userid") String userid) {
		user = userService.selectByPrimaryKey(userid);
		return user;
	}

	
	@RequestMapping(value = "/{userid}/delete")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("userid") String userid) {
		Map<String, Object> result = new HashMap<String, Object>();
		int row = userService.deleteByPrimaryKey(userid);
		if (row == 1) {
			result.put("result", ResultCode.SUCCESS);
			result.put("resultMsg", "删除用户成功！");
		} else {
			result.put("result", ResultCode.FAILURE);
			result.put("resultMsg", "该用户已不存在！");
		}
		return result;
	}

	
	@RequestMapping(value = "/isexist")
	@ResponseBody
	public String isExist(String loginname, String userid) {
		int result = userService.findByKeyCount("loginname", loginname,"userid", userid);
		if (result == 0) {
			return ResultCode.UNEXIST;
		} else {
			return ResultCode.EXIST;
		}
	}
	
}



