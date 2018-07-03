<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加停车场</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">停车场信息</div>
        <form id="parkinglotInfoForm" name="parkinglotInfoForm" method="post"  enctype="multipart/form-data">
            <table cellpadding="2">
                <tr   >
                    <td>停车场名称:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="parkinglotname" name="parkinglotname"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[2,10],
									   		cremote:['parkinglot/isexist','parkinglotname','parkinglotid']
									   }" />
					</td>
				</tr>
				<tr>
                    <td>停车场地址:</td>
                    <td>
                    	 <input class="easyui-textbox" name="parkinglotaddress" data-options="required:true,multiline:true,validType:{length:[2,50]}"  style="height:60px">
                    </td>
                </tr>
				<tr>
                    <td>经度:</td>
                    <td>
                    	 <input class="easyui-textbox" name="longitude" data-options="required:true">
                    </td>
                </tr>
                <tr>
                    <td>纬度:</td>
                    <td>
                    	 <input class="easyui-textbox" name="latitude" data-options="required:true" >
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
                <c:if test="${opt !='add'}">	  
                <tr>
                    <td>入口地图:</td>
                    <td>
                    	 <img alt="" style="height:100px; width:100" src="<c:url value="/mapfiles/${ingressmap }" />">
                    </td>
                </tr>
                </c:if>
                <c:if test="${opt !='view'}">  
                <tr>
                    <td>入口地图:</td>
                    <td>
                    	 <input class="easyui-filebox" name="ingressmapfile" data-options="prompt:'请选择一张图'" style="width:100%">
                    </td>
                </tr>    
                </c:if>
                <tr>
                	<td>备注:</td>
                    <td><input class="easyui-textbox" name="note" data-options="multiline:true,validType:{length:[1,100]}" style="height:60px"></input></td>
                </tr>
				<tr>
                    <td></td>
                    <td>
                    	 <input type="hidden" name="parkinglotid" id="parkinglotid" ></input>
                    </td>
                </tr>
               
            </table>
           
        </form>
        
        </div>
</body>
</html>
