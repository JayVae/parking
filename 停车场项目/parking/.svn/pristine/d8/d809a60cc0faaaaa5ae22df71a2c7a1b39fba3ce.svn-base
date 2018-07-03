<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>列表</title>
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
		<div id="freetimebucketSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		     <form action="" id="freetimebucketSdForm">            
		                    空闲时段模板名称：<input type="text" id="loginname" name="loginname" style="height:20px;">
		                    物业：<input type="text" id="realname" name="realname" style="height:20px;">
		                    
	                              状态：<select class="easyui-combobox" name="state" data-options="required:true" >
                    		<option value="0">禁用</option>
                    		<option value="1" selected>可用</option>
                    	</select>	           
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad('freetimebucketDg','freetimebucketSdForm')">查询</a>
	         </form> 
		</div>  
     	     
        <table id="freetimebucketDg"   title="空闲时段模板列表"   url="freetimebuckettmp/list" method="post" 	    		
	    		rownumbers="true" fitColumns="true" singleSelect="true" 
	    		sortName="freetimebuckettmpid" sortOrder="desc"  
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]" striped="true">
	        <thead>
	            <tr>	            	
	            	<th field="freetimebuckettmpid" hidden="true">ID</th>
	                <th field="name" sortable="true" width="100">空闲时段模板名称</th>
	                <th field='realname'  width="100">用户姓名</th>
	                <th field='totalhour' sortable="true" width="100">总时长</th>
	                <th field='state' sortable="true" width="100" formatter="freetimebucketStateFmt">是否有效</th>
	            </tr>
	        </thead>
	    </table>
	    
	</div>   
	<script type="text/javascript">	
			
			function freetimebucketStateFmt(value, row, index){
				if (value == 0){  
	                 return '<div class="div-state-off">禁用</div>';  
	             } else {  
	                 return '<div class="div-state-on">可用</div>';  
	             }
			}
			
			
			
			//dg在初始化时加入查询条件
			$('#freetimebucketDg').datagrid({
				queryParams: dgParams('freetimebucketSdForm'),
				view: detailview,
	            detailFormatter:function(index,row){
	                    return '<div style="padding:2px"><table class="ddv"></table></div>';
	            },
	            onExpandRow: function(index,row){
                    var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                    ddv.datagrid({
                        url:'<c:url value="/freetimebuckettmp/bucket/list" />?freetimebuckettmpid='+row.freetimebuckettmpid,
                        fitColumns:true,
                        singleSelect:true,
                        rownumbers:true,
                        loadMsg:'',
                        height:'auto',
                        columns:[[
                            {field:'freetimebucketid',hidden:'true',width:200},
                            {field:'freetimebucketbegin',title:'开始时间',width:100,align:'right'},
                            {field:'freetimebucketend',title:'结束时间',width:100,align:'right'},
                            {field:'price',title:'每小时价格',width:100,align:'right'}
                        ]],
                        onResize:function(){
                            $('#freetimebucketDg').datagrid('fixDetailRowHeight',index);
                        },
                        onLoadSuccess:function(){
                            setTimeout(function(){
                                $('#freetimebucketDg').datagrid('fixDetailRowHeight',index);
                            },0);
                        }
                    });
                    $('#freetimebucketDg').datagrid('fixDetailRowHeight',index);
                }
			});		

	</script> 
</body>
</html>
