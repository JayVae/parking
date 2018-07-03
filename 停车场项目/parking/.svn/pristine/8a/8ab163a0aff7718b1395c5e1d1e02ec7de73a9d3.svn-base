<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加车位</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">车位信息</div>
        <form id="parkingplaceInfoForm" name="parkingplaceInfoForm" method="post" >
            <table cellpadding="2">
                <tr   >
                    <td>停车场名称:</td>
                    <td >
                    	 <input class="easyui-validatebox textbox"  name="parkinglotname"
   							 >
					</td>
				</tr>
				
				<tr >
                    <td>停车场分层</td>
                    <td>
                    	<input class="easyui-validatebox textbox" name="slicename"
   							>
                    </td>
                </tr>
				<tr>
                    <td>车位编号:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="parkingplaceno"></input></td>
                </tr>
                
                <tr>
                	<td>在地图的位置:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="positionofmap" 
                    			data-options="multiline:true" style="height:60px"></input></td>
                </tr>
               
				<tr>
                    <td>状态:</td>
                    <td>
                    	<select class="easyui-combobox" name="usestate" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>
                    </td>
                </tr>
            </table>
           <input  type="hidden" name="parkingplaceid">
        </form>
        
        </div>
       
</body>
</html>
