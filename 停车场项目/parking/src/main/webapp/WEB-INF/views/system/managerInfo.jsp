<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">管理员信息</div>
        <form id="managerInfoForm" name="managerInfoForm" method="post" >
            <table cellpadding="2">
                <tr   >
                    <td>登录名:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="loginname" name="loginname"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[6,30],
									   		cremote:['manager/isexist','loginname','managerid']
									   }" />
					</td>
				</tr>
				<c:if test="${opt=='add' }">
				<tr >
                    <td>密码</td>
                    <td>
                    	<input class="easyui-validatebox textbox" type="password" name="loginpwd" 
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[6,30]
									   }" />
                    </td>
                </tr>
                </c:if>
				<tr>
                    <td>昵称:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="nickname"></input></td>
                </tr>
                <tr>
                	<td>真实姓名:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="realname" data-options="required:true"></input></td>
                </tr>
				<tr>
                    <td>Email:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="email" data-options="validType:'email'"></input></td>
                </tr>
                <tr>
                	<td>手机号码:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="mobile" 
                    			data-options="required:true,validType:'mobile'"></input></td>
                </tr>
                <tr>
                	<td>固定电话:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="phone" 
                    			data-options="validType:'phone'"></input></td>
                </tr>
				<tr>
				<td>地址:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="addr" ></input></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                    	<select class="easyui-combobox" name="sex" data-options="required:true" >
                    		<option value="0">女</option>
                    		<option value="1">男</option>
                    	</select>
                    </td>
                </tr>
				<tr>
                    <td>状态:</td>
                    <td>
                    	<select class="easyui-combobox" name="state" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td>角色</td>
                    <td>
                    	    <input class="easyui-combobox" name="roleid"
   							 data-options="valueField:'roleid',textField:'rolename',url:'role/roles.json?state=1&type=1',required:true">
                    </td>
                </tr>
                
				<tr>
                    <td></td>
                    <td>
                    	 <input type="hidden" name="managerid" id="managerid" ></input>
                    	 <input type="hidden" name="accountroleid" id="accountroleid" ></input>
                    	 <input type="hidden" name="managerinsiteid" id="managerinsiteid" ></input>
                    </td>
                </tr>
               
            </table>
           
        </form>
        
        </div>
</body>
</html>
