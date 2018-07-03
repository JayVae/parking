<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>权限列表</title>
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
     	 
		 <div class="easyui-panel" style="padding:5px;">
			<!-- <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="reloadpermissionsTg('1')">后台系统类</a>
			<a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="reloadpermissionsTg('2')">快递类</a>
			<a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="reloadpermissionsTg('3')">物业类</a>
			<a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="reloadpermissionsTg('4')">普通用户类</a>
			 -->
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="collapseAll()">收起全部</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="expandAll()">展开全部</a>
		</div>
		<table id="permissionsTg" class="easyui-treegrid" title="列表" style="height:700px"
					data-options="
					iconCls: 'icon-ok',
					rownumbers: true,
					animate: true,
					lines: true,
					url: 'permissions/list.json?type=1',
					method: 'get',
					idField: 'permissionsid',
					treeField: 'title',
					">
				<thead>
					<tr>
						<th field="permissionsOpt" formatter="permissionsOptFmt" width="100">操作</th>
						<th field="permissionsid" width="60">ID</th>
						<th field="title" width="150">权限名称</th>
						<th field="permstr" width="150">权限字符</th>
						<th field="url" width="150">URL</th>
						<th field="ordernum" width="60">显示顺序</th>
						<th field="usablestate" formatter="usablestateFmt" width="40">状态</th>
						<th field="notes" width="200">备注</th>
					</tr>
				</thead>
		</table>	
	    <div id="permissionsDlg" class="easyui-dialog" style="width:400px;height:540px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#permissionsDlg-buttons" >
         </div>
	    <div id="permissionsDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="savePermissions()" style="width:90px" id="permissionsSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#permissionsDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div>   
	<script type="text/javascript">	
			function usablestateFmt(value, row, index){
				if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			function permissionsOptFmt(value, row, index){
				var opt=
				"<a href='#' class='fa fa-pencil-square-o fa-lg' style='fontsize:12px' plain='true' onclick='editPermissions("+row.permissionsid+")'></a> "+
	            "<a href='#' class='fa fa-trash-o fa-lg' style='fontsize:12px' plain='true' onclick='destroyPermissions("+row.permissionsid+")'></a> "+
	            "<a href='#' class='fa fa-crosshairs fa-lg'  plain='true' onclick='viewPermissions("+row.permissionsid+")'></a>"
				if(row.level < 3){
					opt = "<a href='#' class='fa fa-plus fa-lg' style='fontsize:12px' onclick='newPermissions("+row.permissionsid+")'></a>   "+opt;
				}else{
					opt = "&nbsp;&nbsp;&nbsp;&nbsp;"+opt;
				}
				return opt ;
			}
				
			function collapseAll(){
				 $('#permissionsTg').treegrid('collapseAll');
			}
			function expandAll(){
				 $('#permissionsTg').treegrid('expandAll');
			}
			
			function reloadpermissionsTg(type){
				 $('#permissionsTg').treegrid({
					 url:'permissions/list.json?type='+type
				 });
				 
			}

			var permissionsOptUrl;
			//添加
		    function newPermissions(permissionsid){
		    	$('#permissionsSave').show();
		    	$('#permissionsTg').treegrid('select', permissionsid);
		    	var row = $('#permissionsTg').treegrid('getSelected');
		    	var data = {
		    			parentid:row.permissionsid,
		    			parenttitle:row.title,
		    			level:row.level+1,
		    			type:row.type
		    	};
		    	openHrefLoadDlg('permissionsDlg','<c:url value="/permissions/info?opt=add" />','添加权限','permissionsInfoForm',data);
		        permissionsOptUrl = "permissions/insert";
		    }
		    function editPermissions(permissionsid){
		    	$('#permissionsSave').show();
		    	$('#permissionsTg').treegrid('select', permissionsid);
		    	var row = $('#permissionsTg').treegrid('getSelected');
		    	openHrefLoadDlg('permissionsDlg', '<c:url value="/permissions/info?opt=edit" />', '编辑权限','permissionsInfoForm','permissions/'+permissionsid+'/edit');
		    	permissionsOptUrl = "permissions/update"
		    }
		    
		    function viewPermissions(permissionsid){
		    	$('#permissionsSave').hide();
		    	openLoadDlg('permissionsDlg','查看权限','permissionsInfoForm','permissions/'+permissionsid+'/view');
		    }
		    
		    function savePermissions(){
		    	saveTreegridObj('permissionsTg', 'permissionsDlg', 'permissionsInfoForm', permissionsOptUrl);
		    }
		    
		    function destroyPermissions(permissionsid) {
		    	destroyTreegridObj('permissionsTg','permissions/'+permissionsid+'/delete');			
			}
			
	</script> 
</body>
</html>
