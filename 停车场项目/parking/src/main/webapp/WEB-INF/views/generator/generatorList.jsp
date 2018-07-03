<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>所有表</title>
	    	<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/themes/default/easyui.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/themes/icon.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/font-awesome-4.2.0/css/font-awesome.min.css" />">
			<script type="text/javascript" src="<c:url value="/static/easyui/jquery.min.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/easyui/jquery.easyui.min.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/easyui/locale/easyui-lang-zh_CN.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/js/main.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/js/validateboxRules.js" />"></script>
		
	</head>
<body>
	<div style="padding-top:15px; padding-left:5px; padding-right:15px;">			 
		<div id="generatorSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="generatorSdForm">            
		                   表名：<input type="text" id="loginname" name="loginname" style="height:20px;">
		                    
	                              状态：<select class="easyui-combobox" name="state" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('generatorDg','generatorSdForm')">查询</a>
	         </form> 
		</div>  
     	<div id="generatorTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newManager()">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="editManager()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-trash-o fa-lg" plain="true" onclick="destroyManager()">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewManager()">查看</a>
        </div>      
        <table id="generatorDg"   title="管理员列表"   url="gen/list" method="post" 	    		
	    		rownumbers="true" fitColumns="true" singleSelect="true" toolbar="#generatorTb"
	    		sortName="generatorid" sortOrder="asc"  
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true">
	        <thead>
	            <tr>	            	
	                <th field="tablename" sortable="true" width="100">表名</th>
	                
	            </tr>
	        </thead>
	    </table>
	    <div id="generatorDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#generatorDlg-buttons" >
         </div>
	    <div id="generatorDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveManager()" style="width:90px" id="generatorSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#generatorDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div>   
	<script type="text/javascript">	
			function generatorSexFmt(value, row, index){
				if (value == 0){  
	                 return '女';  
	             } else {  
	                 return '男';  
	             }
			}
			function generatorStateFmt(value, row, index){
				if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			
			//dg在初始化时加入查询条件
			$('#generatorDg').datagrid({
				queryParams: dgParams('generatorSdForm')
			});		

			var generatorOptUrl;
			//添加
		    function newManager(){
		    	$('#generatorSave').show();	       	       
		    	newHrefObj('generatorDlg','<c:url value="/generator/info?opt=add" />','添加管理员','generatorInfoForm');
		        generatorOptUrl = "generator/insert";
		    }
		    function editManager(){
		    	$('#generatorSave').show();
		    	var generatorDgRow =getSelectRow('generatorDg');
		    	if(generatorDgRow){
		    		openHrefLoadDlg('generatorDlg','<c:url value="/generator/info?opt=edit" />','编辑管理员','generatorInfoForm',generatorDgRow);
		    	}		    	
		    	generatorOptUrl = "generator/update"
		    }
		    
		    function viewManager(){
		    	$('#generatorSave').hide();
		    	var generatorDgRow =getSelectRow('generatorDg');
		    	if(generatorDgRow){
		    		openHrefLoadDlg('generatorDlg','<c:url value="/generator/info?opt=edit" />','编辑管理员','generatorInfoForm',generatorDgRow);
		    	}
		    }
		    
		    function saveManager(){
		    	saveObj('generatorDg', 'generatorDlg', 'generatorInfoForm', generatorOptUrl);
		    }
		    
		    function destroyManager() {
		    	destroyObj('generatorDg','generator/'+getSelectRow('generatorDg').generatorid+'/delete');			
			}
			
	</script> 
</body>
</html>
