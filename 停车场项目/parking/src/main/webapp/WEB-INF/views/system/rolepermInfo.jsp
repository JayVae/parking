<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分配角色权限</title>
    
</head>
<body>   
        <div style="padding:10px 20px 20px 10px">
        <div class="ftitle">角色权限</div>
        <form id="rolepermInfoForm" name="rolepermInfoForm" method="post" >
        	<input  type="hidden" id="type" name="type" />
            <input  type="hidden" id="roleid" name="roleid" />
            <table cellpadding="2">
                <tr   >
                    <td>角色名称:</td>
                    <td >
                    	<input class="easyui-validatebox textbox" type="text" id="rolename" name="rolename" readonly/>
					</td>
				</tr>				               
            </table>
            
           	<div class="easyui-panel" style="padding:5px;height:300px;">
				<ul id="rolepermTree" data-options="method:'get',animate:true,checkbox:true,cascadeCheck:true"></ul>
			</div>
        </form>

        </div>
        <script type="text/javascript">
        	var row = getSelectRow('roleDg');
	        $('#rolepermTree').tree({
	        	url:'role/'+row.roleid+'/permissions.json?state=1&type='+row.type,
	        	formatter:function(node){
	        		return node.title;
	        	}
	        });
        	
        </script>
</body>
</html>
