<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>用户列表</title>
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
		<div id="userSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="userSdForm">            
		                    登录名：<input type="text" id="loginname" name="loginname">
	                              状态：<input type="text" id="state" name="state">	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('userDg','userSdForm')">查询</a>
	         </form> 
		</div>  
     	<div id="userTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newuser()">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="edituser()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-trash-o fa-lg" plain="true" onclick="destroyuser()">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewuser()">查看</a>
        </div>      
        <table id="userDg"   title="用户列表"   url="user/list" method="post" 	    		
	    		rownumbers="true" fitColumns="true" singleSelect="true" toolbar="#userTb"
	    		sortName="userid" sortOrder="asc"   idField="userid"
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true">
	        <thead>
	            <tr>	            	
	            	<th field="userid" sortable="true" hidden="true">ID</th>
	                <th field="loginname" sortable="true">登录名称</th>
	                <th field='nickname' sortable="true">昵称</th>
	                <th field='realname' sortable="true">真实姓名</th>
	                <th field='email' sortable="true">邮箱</th>
	                <th field='mobile' sortable="true">手机号码</th>
	                <th field='phone' sortable="true">固定电话</th>
	                <th field='addr' sortable="true">地址</th>
	                <th field='sex' sortable="true" formatter="sexFmt">性别</th>
	                <th field='registertime' sortable="true">注册时间</th>
	                <th field='state' sortable="true" formatter="stateFmt" >用户状态</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="userDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#userDlg-buttons" href="<c:url value="/user/info" />">
         </div>
	    <div id="userDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveuser()" style="width:90px" id="userSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#userDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div>   
	<script type="text/javascript">	
			function sexFmt(value, row, index){
				if (value == 0){  
	                 return '女';  
	             } else {  
	                 return '男';  
	             }
			}
			function stateFmt(value, row, index){
				if (value == 0){  
	                 return '禁用';  
	             } else {  
	                 return '可用';  
	             }
			}
			
			//dg在初始化时加入查询条件
			$('#userDg').datagrid({
				queryParams: dgParams('userSdForm')
			});		

			var userOptUrl;
			//添加
		    function newuser(){
		    	$('#userSave').show();	       	       
		        newObj('userDlg','添加用户','userInfoForm');
		        userOptUrl = "user/insert";
		    }
		    function edituser(){
		    	$('#userSave').show();
		    	openLoadDlg('userDlg','编辑用户','userInfoForm','user/'+getSelectRow('userDg').userid+'/edit');
		    	userOptUrl = "user/update"
		    }
		    
		    function viewuser(){
		    	$('#userSave').hide();
		    	openLoadDlg('userDlg','查看用户','userInfoForm','user/'+getSelectRow('userDg').userid+'/view');
		    }
		    
		    function saveuser(){
		    	saveObj('userDg', 'userDlg', 'userInfoForm', userOptUrl);
		    }
		    
		    function destroyuser() {
		    	destroyObj('userDg','user/'+getSelectRow('userDg').userid+'/delete');			
			}
			
	</script> 
</body>
</html>
