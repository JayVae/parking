package com.hu.parking.api.parkingSpace;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;









import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.hu.parking.common.ResultCode;
import com.hu.parking.entity.Freetimebuckettmp;
import com.hu.parking.entity.Freetimebucket;
import com.hu.parking.entity.Parkingplaceapproval;
import com.hu.parking.service.msgPush.Message;
import com.hu.parking.service.msgPush.MessagePushServiceHandler;
import com.hu.parking.service.parkingSpace.ParkingplaceapprovalService;
import com.hu.parking.util.Identities;
import com.hu.parking.util.JsonBinder;

/**
 * 空闲时间模板
 * @author leeyuan
 *
 */
@Controller
@RequestMapping(value = "/api/ppapproval")
public class ParkingplaceapprovalAPI {

	
	@Autowired
	ParkingplaceapprovalService parkingplaceapprovalService;
	
	@Autowired
	MessagePushServiceHandler messagePushServiceHandler;
	
	
	/**
	 * 用户车位申请列表
	 * @return
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Parkingplaceapproval> list(String orduserid, String propertyuserid, String approvalstate) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orduserid", orduserid);
		params.put("propertyuserid", propertyuserid);
		params.put("approvalstate", approvalstate);
		List<Parkingplaceapproval> parkingplaceapprovalList = parkingplaceapprovalService.findByParams(params, "approvalstate", "asc");
		return parkingplaceapprovalList;
	}

	
	
	/**
	 * 用户申请车位
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert(String orduserid, String parkingplaceid) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = 0;
			Parkingplaceapproval parkingplaceapproval = new Parkingplaceapproval();
			parkingplaceapproval.setParkingplaceapprovalid(Identities.uuid());
			parkingplaceapproval.setApplytime(new Date());
			parkingplaceapproval.setOrduserid(orduserid);
			parkingplaceapproval.setParkingplaceid(parkingplaceid);
			parkingplaceapproval.setApprovalstate("1");
			result = parkingplaceapprovalService.insertSelective(parkingplaceapproval);
			if (result == 0) {
				resultMap.put("result", ResultCode.FAILURE);
				resultMap.put("resultMsg", "申请失败！");
			}else {
				resultMap.put("result", ResultCode.SUCCESS);
				resultMap.put("resultMsg", "申请成功，请等待物业审核！");
				Message message = new Message();
				message.setMsgname("approval");
				message.setMsgtype("1");
				message.setMsgcontent("有新的车位审核！");
				message.setMsgend("<e>");
				messagePushServiceHandler.sendMsg(message);
			}
		} catch (Exception e) {
			resultMap.put("result", ResultCode.ERROR);
			resultMap.put("resultMsg", "系统错误！");
		}
		return resultMap;
	}
	
	/**
	 * 物业审核车位
	 * @param parkingplaceapprovalid 
	 * @param approvalstate  2:审核通过  3：审核不通过
	 * @return
	 */
	@RequestMapping(value = "/approval")
	@ResponseBody
	public Map<String, Object> approval(String propertyuserid, String parkingplaceapprovalid, String approvalstate) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int result = 0;
			result = parkingplaceapprovalService.approvalid(propertyuserid, parkingplaceapprovalid, approvalstate);
			if (result == 0) {
				resultMap.put("result", ResultCode.FAILURE);
				resultMap.put("resultMsg", "审核失败！");
			}else {
				resultMap.put("result", ResultCode.SUCCESS);
				resultMap.put("resultMsg", "审核成功");
			}
		} catch (Exception e) {
			resultMap.put("result", ResultCode.ERROR);
			resultMap.put("resultMsg", "系统错误！");
		}
		return resultMap;
	}

	
}
