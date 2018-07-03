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
                    	 <input  name="parkinglotid" id="parkinglotidOfinfo"
   							 data-options="required:true">
					</td>
				</tr>
				
				<tr >
                    <td>停车场分层</td>
                    <td>
                    	<input name="parkinglotsliceid" id="parkinglotsliceidOfinfo"
   							 data-options="required:true">
                    </td>
                </tr>
				<tr>
                    <td>车位编号前缀:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="perfixNo"></input></td>
                </tr>
                <tr>
                    <td>车位编号后缀:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="suffixNo"></input></td>
                </tr>
                <tr>
                	<td>车位个数:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="num" data-options="required:true, validType:'integer'"></input></td>
                </tr>
				<tr>
                    <td>起始编号:</td>
                    <td><input class="easyui-validatebox textbox" type="text" name="startNo" data-options="required:true, validType:'integer'"></input></td>
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
           
        </form>
        
        </div>
        <script type="text/javascript">
	        $('#parkinglotidOfinfo').combobox({    
	            url:'parkinglot/parkinglots',    
	            valueField:'parkinglotid',    
	            textField:'parkinglotname' ,
	            onSelect: function (record) {
	            	var url='parkinglot/slice/list?parkinglotid=' + record.parkinglotid;
	            	$('#parkinglotsliceidOfinfo').combobox('clear');
	                $('#parkinglotsliceidOfinfo').combobox('reload', url);
	            }
	        });
	        $('#parkinglotsliceidOfinfo').combobox({
                valueField: 'parkinglotsliceid',
                textField: 'slicename'
            });
        </script>
</body>
</html>
