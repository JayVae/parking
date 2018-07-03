<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>车位审核列表</title>
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
		<div id="managerSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="managerSdForm">            
		                    登录名：<input type="text" id="loginname" name="loginname" style="height:20px;">
		                    真实姓名：<input type="text" id="realname" name="realname" style="height:20px;">
		                    
	                              状态：<select class="easyui-combobox" name="state" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('managerDg','managerSdForm')">查询</a>
	         </form> 
		</div>  
     	<div id="managerTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="editManager()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewManager()">查看</a>
        </div>      
        <table id="managerDg"   title="管理员列表"   url="manager/list" method="post" 	    		
	    		rownumbers="true" fitColumns="true" singleSelect="true" toolbar="#managerTb"
	    		sortName="managerid" sortOrder="asc"  
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true">
	        <thead>
	            <tr>	            	
	            	<th field="managerid" hidden="true">ID</th>
	                <th field="loginname" sortable="true" width="100">登录名称</th>
	                <th field='nickname' sortable="true" width="100">昵称</th>
	                <th field='realname' sortable="true" width="100">真实姓名</th>
	                <th field='email' sortable="true" width="100">邮箱</th>
	                <th field='mobile' sortable="true" width="100">手机号码</th>
	                <th field='phone' sortable="true" width="100">固定电话</th>
	                <th field='addr' sortable="true" width="100">地址</th>
	                <th field='sex' sortable="true" width="100" formatter="managerSexFmt">性别</th>
	                <th field='registertime' sortable="true" width="100">注册时间</th>
	                <th field='rolename' sortable="true"  width="100">用户角色</th>
	                <th field='state' sortable="true" formatter="managerStateFmt" width="100">用户状态</th>
	                <th field='roleid' hidden="true" ></th>
	                <th field='accountroleid' hidden="true" ></th>
	                <th field='managerinsiteid' hidden="true" ></th>
	            </tr>
	        </thead>
	    </table>
	    <div id="managerDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#managerDlg-buttons" >
         </div>
	    <div id="managerDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveManager()" style="width:90px" id="managerSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#managerDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div>   
	<script type="text/javascript">	
			function managerSexFmt(value, row, index){
				if (value == 0){  
	                 return '女';  
	             } else {  
	                 return '男';  
	             }
			}
			function managerStateFmt(value, row, index){
				if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			
			//dg在初始化时加入查询条件
			$('#managerDg').datagrid({
				queryParams: dgParams('managerSdForm')
			});		

			var managerOptUrl;
			//添加
		    function newManager(){
		    	$('#managerSave').show();	       	       
		    	newHrefObj('managerDlg','<c:url value="/manager/info?opt=add" />','添加管理员','managerInfoForm');
		        managerOptUrl = "manager/insert";
		    }
		    function editManager(){
		    	$('#managerSave').show();
		    	var managerDgRow =getSelectRow('managerDg');
		    	if(managerDgRow){
		    		openHrefLoadDlg('managerDlg','<c:url value="/manager/info?opt=edit" />','编辑管理员','managerInfoForm',managerDgRow);
		    	}		    	
		    	managerOptUrl = "manager/update"
		    }
		    
		    function viewManager(){
		    	$('#managerSave').hide();
		    	var managerDgRow =getSelectRow('managerDg');
		    	if(managerDgRow){
		    		openHrefLoadDlg('managerDlg','<c:url value="/manager/info?opt=edit" />','编辑管理员','managerInfoForm',managerDgRow);
		    	}
		    }
		    
		    function saveManager(){
		    	saveObj('managerDg', 'managerDlg', 'managerInfoForm', managerOptUrl);
		    }
		    
		    function destroyManager() {
		    	destroyObj('managerDg','manager/'+getSelectRow('managerDg').managerid+'/delete');			
			}
			
	</script> 
</body>
</html>
