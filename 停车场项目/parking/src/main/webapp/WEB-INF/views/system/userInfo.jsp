<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用戶</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">用戶信息</div>
        <form id="userInfoForm" name="userInfoForm" method="post" >
            <table cellpadding="2">
                <tr   >
                    <td>登录名:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="loginname" name="loginname"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[6,30],
									   		cremote:['user/isexist','loginname','userid']
									   }" />
					</td>
				</tr>
				<tr >
                    <td>密码</td>
                    <td>
                    	<input class="easyui-validatebox textbox" type="password" name="loginpwd" 
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[8,30]
									   }" />
                    </td>
                </tr>
				<tr>
                    <td>昵称:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="nickname" data-options="required:true"></input></td>
                </tr>
                <tr>
                	<td>真实姓名:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="realname" data-options="required:true"></input></td>
                </tr>
				<tr>
                    <td>Email:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                	<td>手机号码:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="mobile" 
                    			data-options="required:true,validType:'mobile'"></input></td>
                </tr>
                <tr>
                	<td>固定电话:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="phone" 
                    			data-options="required:true,validType:'phone'"></input></td>
                </tr>
				<tr>
				<td>地址:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="addr" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                    	<select class="easyui-combobox" name="sex">
                    		<option value="0">女</option>
                    		<option value="1">男</option>
                    	</select>
                    </td>
                </tr>
				<tr>
                    <td>状态:</td>
                    <td>
                    	<select class="easyui-combobox" name="state">
                    		<option value="0">禁用</option>
                    		<option value="1">可用</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td>角色</td>
                    <td>
                    	<select class="easyui-combobox" name="role">
                    		<option value="0">超级用戶</option>
                    		<option value="1">普通用戶</option>
                    	</select>
                    </td>
                </tr>
				<tr>
                    <td></td>
                    <td>
                    	 <input type="hidden" name="userid" id="userid" ></input>
                    </td>
                </tr>
               
            </table>
           
        </form>
        
        </div>
</body>
</html>
