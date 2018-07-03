<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加角色</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">角色信息</div>
        <form id="roleInfoForm" name="roleInfoForm" method="post" >
            <table cellpadding="2">
                <tr   >
                    <td>角色名称:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="rolename" name="rolename"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[2,10],
									   		cremote:['role/isexist','rolename','roleid']
									   }" />
					</td>
				</tr>				
                <tr>
                    <td>角色类型:</td>
                    <td>
                    	<select class="easyui-combobox" name="type" data-options="required:true">
                    		<option value="1">后台系统类</option>
                    		<option value="2">快递类</option>
                    		<option value="3">物业类</option>
                    		<option value="4">普通用户类</option>
                    	</select>
                    </td>
                </tr>
				<tr>
                    <td>状态:</td>
                    <td>
                    	<select class="easyui-combobox" name="state" data-options="required:true">
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>
                    </td>
                </tr>             
                <tr>
                	<td>备注:</td>
                    <td><input class="easyui-textbox" name="notes" data-options="multiline:true" style="height:60px"></input></td>
                </tr>
				<tr>
                    <td></td>
                    <td>
                    	 <input type="hidden" name="roleid" id="roleid" ></input>
                    </td>
                </tr>
               
            </table>
           
        </form>
        
        </div>
</body>
</html>
