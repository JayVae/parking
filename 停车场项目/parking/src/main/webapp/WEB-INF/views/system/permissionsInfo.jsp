<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加权限</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">权限信息</div>
        <form id="permissionsInfoForm" name="permissionsInfoForm" method="post" >
            <table cellpadding="2">
           	 	<c:if test="${opt=='add' }">
           	 	<tr>
                    <td>父权限ID:</td>
                    <td>
                    	<input class="easyui-validatebox textbox"  name="parentid" data-options="required:true" readonly/> (只读)
                    </td>
                </tr>
                
                <tr>
                    <td>父权限名称:</td>
                    <td>
                    	<input class="easyui-validatebox textbox"  name="parenttitle" data-options="required:true" readonly/> (只读)
                    </td>
                </tr>
                </c:if>
                <tr>
                    <td>权限ID:</td>
                    <td >
                    	<c:if test="${opt=='add' }">
	                    	<input class="easyui-validatebox textbox" type="text" id="permissionsid" name="permissionsid"                            
			                 data-options="required:true, 
			                 			   validType:{
										   		length:[2,10],
										   		cremote:['permissions/isexist','permissionsid']
										   }" />
						 </c:if>
						 <c:if test="${opt=='edit' }">
	                    	<input class="easyui-validatebox textbox" type="text" id="permissionsid" name="permissionsid"                            
			                 data-options="required:true" readonly /> (只读)
						 </c:if>			  
					</td>
				</tr>
                
                <tr>
                    <td>权限名称:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="title" name="title"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[2,10],
									   		cremote:['permissions/isexist','title','permissionsid']
									   }" />
					</td>
				</tr>
				
				<tr>
                    <td>权限字符:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="permstr" data-options="required:true,validType:'length[2,20]'"></input></td>
                </tr>
                <tr>
                	<td>路径:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="url" data-options="validType:'length[0,100]'"></input></td>
                </tr>
				<tr>
                    <td>显示顺序:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="ordernum" data-options="required:true,validType:'integer'"></input></td>
                </tr>
                <tr>
                	<td>图标样式:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="icncls" 
                    			data-options="validType:'length[2,50]'"></input></td>
                </tr>
                <tr>
                	<td>权限类别:</td>
                    <td>
                    	<select class="easyui-combobox" name="type" data-options="required:true" readonly>
                    		<option value="1" selected>后台系统类</option>
                    		<option value="2">快递类</option>
                    		<option value="3">物业类</option>
                    		<option value="4">用户类</option>
                    	</select> (只读)
                    </td>
                </tr>
				<tr>
				<td>权限级别:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="level"  readonly></input> (只读)</td>
                </tr>
                <tr>
                    <td>可用状态:</td>
                    <td>
                    	<select class="easyui-combobox" name="usablestate" data-options="required:true">
                    		<option value="1" selected>可用</option>
                    		<option value="0">禁用</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                	<td>备注:</td>
                    <td><input class="easyui-textbox" name="notes" data-options="multiline:true" style="height:60px"></input></td>
                </tr>		             
            </table>
        </form>
        
        </div>
</body>
</html>
