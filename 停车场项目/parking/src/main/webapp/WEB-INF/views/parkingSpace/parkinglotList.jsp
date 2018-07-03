<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>停车场列表</title>
	    	<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/themes/default/easyui.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/themes/icon.css" />">
			<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/font-awesome-4.2.0/css/font-awesome.min.css" />">
			<script type="text/javascript" src="<c:url value="/static/easyui/jquery.min.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/easyui/jquery.easyui.min.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/easyui/locale/easyui-lang-zh_CN.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/js/main.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/js/validateboxRules.js" />"></script>
			<script type="text/javascript" src="<c:url value="/static/easyui/datagrid-detailview.js" />"></script>
	</head>
<body>
	<div style="padding-top:15px; padding-left:5px; padding-right:15px;">			 
		<div id="parkinglotSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="parkinglotSdForm">            
		                    停车场名称：<input type="text" id="loginname" name="loginname" style="height:20px;">
		                    物业：<input type="text" id="realname" name="realname" style="height:20px;">
		                    
	                              状态：<select class="easyui-combobox" name="state" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('parkinglotDg','parkinglotSdForm')">查询</a>
	         </form> 
		</div>  
     	<div id="parkinglotTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newParkinglot()">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="editParkinglot()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-trash-o fa-lg" plain="true" onclick="destroyParkinglot()">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewParkinglot()">查看</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newParkinglotslice()">添加分层</a>
        </div>      
        <table id="parkinglotDg"   title="停车场列表"   url="parkinglot/list" method="post" 	    		
	    		rownumbers="true" fitColumns="true" singleSelect="true" toolbar="#parkinglotTb"
	    		sortName="parkinglotid" sortOrder="asc"  
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true">
	        <thead>
	            <tr>	            	
	            	<th field="parkinglotid" hidden="true">ID</th>
	                <th field="parkinglotname" sortable="true" width="100">停车场名称</th>
	                <th field='parkinglotaddress'  width="100">停车场地址</th>
	                <th field='parkingplacenum' sortable="true" width="100">车位总量</th>
	                <th field='freeparkingplacenum' sortable="true" width="100">空闲车位量</th>
	                <th field='state' sortable="true" width="100" formatter="parkinglotStateFmt">状态</th>
	                <th field='note'  width="100">备注</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="parkinglotDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#parkinglotDlg-buttons" >
         </div>
	    <div id="parkinglotDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveParkinglot()" style="width:90px" id="parkinglotSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#parkinglotDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	    <div id="parkinglotsliceDlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" collapsible="true" minimizable="true" maximizable="true" resizable ="true"
             buttons="#parkinglotsliceDlg-buttons" >
         </div>
	    <div id="parkinglotsliceDlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveParkinglotslice()" style="width:90px" id="parkinglotsliceSave">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#parkinglotsliceDlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div>   
	<script type="text/javascript">	
			
			function parkinglotStateFmt(value, row, index){
				if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			
			function parkinglotsliceOptFmt(value, row, index){
				var slicemap = '"'+row.slicemap+'"';
				var opt=
					"<a href='#' class='fa fa-pencil-square-o fa-lg' style='fontsize:12px' plain='true' onclick='editParkinglotslice("+row.parkinglotsliceid+","+slicemap+")'></a> "+
		            "<a href='#' class='fa fa-trash-o fa-lg' style='fontsize:12px' plain='true' onclick='destroyParkinglotslice("+row.parkinglotsliceid+")'></a> "+
		            "<a href='#' class='fa fa-crosshairs fa-lg'  plain='true' onclick='viewParkinglotslice("+row.parkinglotsliceid+","+slicemap+")'></a>"
		            
	            return opt;  
			}
			
			//dg在初始化时加入查询条件
			$('#parkinglotDg').datagrid({
				queryParams: dgParams('parkinglotSdForm'),
				view: detailview,
	            detailFormatter:function(index,row){
	                    return '<div style="padding:2px"><table class="ddv"></table></div>';
	            },
	            onExpandRow: function(index,row){
                    var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                    ddv.datagrid({
                        url:'<c:url value="/parkinglot/slice/list" />?parkinglotid='+row.parkinglotid,
                        fitColumns:true,
                        singleSelect:true,
                        rownumbers:true,
                        loadMsg:'',
                        height:'auto',
                        columns:[[
                            {field:'parkinglotsliceid',hidden:'true',width:200},
                            {field:'slicename',title:'分层名称',width:100,align:'right'},
                            {field:'slicemap',title:'结构图',width:100,align:'right'},
                            {field:'note',title:'备注',width:100,align:'right'},
                            {field:'parkinglotsliceopt',title:'操作',width:100,align:'right',formatter:parkinglotsliceOptFmt}
                        ]],
                        onResize:function(){
                            $('#parkinglotDg').datagrid('fixDetailRowHeight',index);
                        },
                        onLoadSuccess:function(){
                            setTimeout(function(){
                                $('#parkinglotDg').datagrid('fixDetailRowHeight',index);
                            },0);
                        }
                    });
                    $('#parkinglotDg').datagrid('fixDetailRowHeight',index);
                }
			});		

			var parkinglotOptUrl;
			var parkinglotsliceOptUrl;
			//添加停车场
		    function newParkinglot(){
		    	$('#parkinglotSave').show();	       	       
		    	newHrefObj('parkinglotDlg','<c:url value="/parkinglot/info" />','添加停车场','parkinglotInfoForm');
		        parkinglotOptUrl = "parkinglot/insert";
		    }
			
		  	//添加停车场分层
		    function newParkinglotslice(){
		    	$('#parkinglotsliceSave').show();
		    	var parkinglotDgRow =getSelectRow('parkinglotDg');
		    	if(parkinglotDgRow){
		    		openHrefLoadDlg('parkinglotsliceDlg','<c:url value="/parkinglot/slice/info?opt=add" />','添加停车场分层','parkinglotsliceInfoForm',parkinglotDgRow);
		    	}		    	
		    	parkinglotsliceOptUrl = "parkinglot/slicemap/insert"
		    }
		  
		  	//编辑停车场
		    function editParkinglot(){
		    	$('#parkinglotSave').show();
		    	var parkinglotDgRow =getSelectRow('parkinglotDg');
		    	if(parkinglotDgRow){
		    		openHrefLoadDlg('parkinglotDlg','<c:url value="/parkinglot/info?ingressmap=" />'+parkinglotDgRow.ingressmap+'&opt=edit','编辑停车场','parkinglotInfoForm',parkinglotDgRow);
		    	}		    	
		    	parkinglotOptUrl = "parkinglot/update"
		    }
		    
		  	//编辑停车场分层
		    function editParkinglotslice(parkinglotsliceid,slicemap){
		    	$('#parkinglotsliceSave').show();
		    	if(parkinglotsliceid){
		    		openHrefLoadDlg('parkinglotsliceDlg','<c:url value="/parkinglot/slice/info?slicemap=" />'+slicemap+'&opt=edit','编辑停车场分层','parkinglotsliceInfoForm','<c:url value="/parkinglot/slice/" />'+parkinglotsliceid);
		    	}		    	
		    	parkinglotsliceOptUrl = "parkinglot/slice/update"
		    }
		    
		  	//停车场详情
		    function viewParkinglot(){
		    	$('#parkinglotSave').hide();
		    	var parkinglotDgRow =getSelectRow('parkinglotDg');
		    	if(parkinglotDgRow){
		    		openHrefLoadDlg('parkinglotDlg','<c:url value="/parkinglot/info?ingressmap=" />'+parkinglotDgRow.ingressmap+'&opt=view','停车场详情','parkinglotInfoForm',parkinglotDgRow);
		    	}
		    }
		    
		  	//停车场分层详情
		    function viewParkinglotslice(parkinglotsliceid,slicemap){
		    	$('#parkinglotsliceSave').hide();
		    	if(parkinglotsliceid){
		    		openHrefLoadDlg('parkinglotsliceDlg','<c:url value="/parkinglot/slice/info?slicemap=" />'+slicemap+"&opt=view",'停车场分层详情','parkinglotsliceInfoForm','<c:url value="/parkinglot/slice/" />'+parkinglotsliceid);
		    	}		    	
		    }
		    
		    function saveParkinglot(){
		    	saveObj('parkinglotDg', 'parkinglotDlg', 'parkinglotInfoForm', parkinglotOptUrl);
		    }
		    
		    //保存停车场分层
		    function saveParkinglotslice(){
		    	saveObj('parkinglotDg', 'parkinglotsliceDlg', 'parkinglotsliceInfoForm', parkinglotsliceOptUrl);
		    }
		    
		    function destroyParkinglot() {
		    	destroyObj('parkinglotDg','parkinglot/'+getSelectRow('parkinglotDg').parkinglotid+'/delete');			
			}
		    
		    //删除停车场分层
		    function destroyParkinglotslice(parkinglotsliceid) {
		    	destroyObj('parkinglotDg','parkinglot/slice/'+parkinglotsliceid+'/delete');			
			}
			
	</script> 
</body>
</html>
