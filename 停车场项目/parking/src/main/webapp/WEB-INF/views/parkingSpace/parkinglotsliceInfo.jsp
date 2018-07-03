<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加停车场分层</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">停车场分层信息</div>
        <form id="parkinglotsliceInfoForm" name="parkinglotsliceInfoForm" method="post" enctype="multipart/form-data" >
            <table>
            	<c:if test="${opt =='add'}">
            	<tr>
                    <td>停车场名称:</td>
                    <td>
                    	 <input class="easyui-textbox" name="parkinglotname"  readonly="true">
                    </td>
                </tr>
                </c:if>
                <tr   >
                    <td>停车场分层名称:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="slicename" name="slicename"                            
		                 data-options="required:true, 
		                 			   validType:{
									   		length:[2,10],
									   		cremote:['parkinglot/slice/isexist','slicename','parkinglotsliceid']
									   }" />
					</td>
				</tr>	
				<c:if test="${opt !='add'}">
				<tr>
                    <td>结构图:</td>
                    <td>
                    	 <img alt="" style="height:100px; width:100" src="<c:url value="/mapfiles/${slicemap }" />">
                    </td>
                </tr>
                </c:if>
                <c:if test="${opt !='view'}">			
                <tr>
                    <td>结构图:</td>
                    <td>
                    	 <input class="easyui-filebox" name=mapfile data-options="prompt:'请选择一张结构图'" style="width:100%">
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
                    	 <input type="hidden" name="parkinglotsliceid" id="parkinglotsliceid" ></input>
                    </td>
                </tr>
               
            </table>
           
        </form>
        
        </div>
</body>
</html>
