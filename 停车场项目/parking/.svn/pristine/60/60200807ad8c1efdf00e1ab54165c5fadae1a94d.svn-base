<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>角色列表</title>
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
		<div id="roleSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="roleSdForm">            
		                    角色名称：<input type="text" id="rolename" name="rolename" style="height:20px;">
		                    角色类型：<select class="easyui-combobox" name="type">
                    		<option value="1">后台系统类</option>
                    		<option value="2">快递类</option>
                    		<option value="3">物业类</option>
                    		<option value="4">普通用户类</option>
                    	</select>
	                              状态：<select class="easyui-combobox" name="state">
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    		
                    	</select>	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('roleDg','roleSdForm')">查询</a>
	         </form> 
		</div>  
     	<div id="roleTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newRole()">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="editRole()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-trash-o fa-lg" plain="true" onclick="destroyRole()">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewRole()">查看</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="editRoleperm()">分配权限</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewRoleperm()">查看权限</a>
        </div>      
        <table id="roleDg"   title="角色列表"   url="role/list"
        				style="margin: 100px"
   			    		rownumbers="true"  
   			    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true"
   			    		sortName="roleid" sortOrder="asc"   
   			            data-options="singleSelect:true,method:'post',toolbar:'#roleTb',">
	        <thead>
	            <tr>
	            	<th field="roleid" sortable="true" hidden="true">ID</th>
	                <th field="rolename" sortable="true" width="100">角色名称</th>
	                <th field='type' sortable="true" width="100" formatter="roleTypeFmt">角色类型</th>
	                <th field='state' sortable="true" width="100" formatter="roleStateFmt" >角色状态</th>
	                <th field='notes'  width="200">备注</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="roleDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#roleDlg-buttons" href="<c:url value="/role/info" />">
        </div>
	    <div id="roleDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRole()" style="width:90px" id="roleSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="closeDlg('roleDlg')" style="width:90px">取消</a>
	    </div>
	    <div id="rolepermDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#rolepermDlg-buttons" href="<c:url value="/role/perminfo" />">
        </div>
	    <div id="rolepermDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRoleperm()" style="width:90px" id="rolepermSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="closeDlg('rolepermDlg')" style="width:90px">取消</a>
	    </div>
	    
	</div>   
	<script type="text/javascript">	
			function roleStateFmt(value, row, index){
				 if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			function roleTypeFmt(value, row, index){
				 if (value == 1){  
	                 return '后台系统类';  
	             } else if (value == 2) {  
	                 return '快递类';  
	             } else if (value == 3) {  
	                 return '物业类';  
	             } else if (value == 4) {  
	                 return '普通用户类';  
	             }
			}
			
			//dg在初始化时加入查询条件
			$('#roleDg').datagrid({
				queryParams: dgParams('roleSdForm')
			});		

			var roleOptUrl;
			//添加
		    function newRole(){
		    	$('#roleSave').show();	       	       
		        newObj('roleDlg','添加角色','roleInfoForm');
		        roleOptUrl = "role/insert";
		    }
		    function editRole(){
		    	$('#roleSave').show();
		    	openLoadDlg('roleDlg','编辑角色','roleInfoForm','role/'+getSelectRow('roleDg').roleid+'/edit');
		    	roleOptUrl = "role/update"
		    }
		    
		    function viewRole(){
		    	$('#roleSave').hide();
		    	openLoadDlg('roleDlg','查看角色','roleInfoForm','role/'+getSelectRow('roleDg').roleid+'/view');
		    }
		    
		    function saveRole(){
		    	saveObj('roleDg', 'roleDlg', 'roleInfoForm', roleOptUrl);
		    }
		    
		    function destroyRole() {
		    	destroyObj('roleDg','role/'+getSelectRow('roleDg').roleid+'/delete');			
			}
		    
		    function viewRoleperm(){
		    	$('#rolepermSave').hide();
		    	var row = getSelectRow('roleDg');
		    	if(row){
		    		openLoadDlg('rolepermDlg','查看角色权限','rolepermInfoForm',row);
		    	}
		    	
		    }
		    
		    function editRoleperm(){
		    	$('#rolepermSave').show();
		    	var row = getSelectRow('roleDg');
		    	if(row){
		    		openLoadDlg('rolepermDlg','分配权限','rolepermInfoForm',row);
		    	}
		    	
		    }
		    
		    function saveRoleperm(){
		    	var permids = '';
		    	var nodesIndeter = $('#rolepermTree').tree('getChecked','indeterminate');
				for(var i=0; i<nodesIndeter.length; i++){
					if (permids != '') {
						permids += ',';
					} 
					permids += nodesIndeter[i].permissionsid;
				}
				var nodes = $('#rolepermTree').tree('getChecked');
				for(var i=0; i<nodes.length; i++){
					if (permids != '') {
						permids += ',';
					} 
					permids += nodes[i].permissionsid;
				}
				alert(permids);
				var postdata = {
					roleid:$("form#rolepermInfoForm #roleid").val(),
					permissionsids:permids
				};
				
				$.post("role/permissions/update", postdata,
						function(result) {
							if (result.result == "5000") {
								$.messager.show({
									title : '操作成功',
									msg : result.resultMsg
								});
								$('#rolepermDlg').dialog('close'); // close the dialog
							} else {
								$.messager.alert('操作失败', result.resultMsg, 'error');
							}
				});				
		    }
			
	</script> 
</body>
</html>
