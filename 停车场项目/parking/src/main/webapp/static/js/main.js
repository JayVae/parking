/**
 * 
 */
// 打开标签页
function openTab1(url, title) {
	if ($('#tt').tabs('exists', title)) {
		$('#tt').tabs('select', title);
	} else {
		var content = '<iframe  frameborder="0"  src="' + url + '" style="width:100%;height:98%;"></iframe>';
		$('#tt').tabs('add', {
			title : title,
			content : content,
			closable : true
		});
	}
}

function openTab(url, title) {
	if ($('#tt').tabs('exists', title)) {
		$('#tt').tabs('select', title);
	} else {
		$('#tt').tabs('add', {
			title : title,
			href : url,
			closable : true
		});
	}
}

function submitFormAjax(ff) {
	$(ff).form('submit');
}

function submitFormValidate(ff) {
	$(ff).form('submit', {
		onSubmit : function() {
			return $(this).form('enableValidation').form('validate');
		}
	});
}

function clearForm(ff) {
	$(ff).form('clear');
}

function resetForm(ff) {
	$("#"+ff).form('reset');
}

function submitForm(ff) {
	$(ff).submit();
}

// 按查询条件查询
function searchLoad(datagridId, sdFormId) {
	$('#' + datagridId).datagrid('options').queryParams = dgParams(sdFormId);
	$('#' + datagridId).datagrid('load');
}

// 获得查询条件
function dgParams(sdFormId) {
	var params = {};
	$.each($('#' + sdFormId).serializeArray(), function(index) {
		if (this['value'] != "") {
			params['params[' + this['name'] + ']'] = $.trim(this['value']);
		}
	});
	return params;
}

function closeDlg(dlgId){
	$('#'+dlgId).dialog('close')
}

function newObj(dlgId, dlgtitle, dlgformId) {
	$('#' + dlgId).dialog('open').dialog('setTitle', dlgtitle);
	$('#'+dlgformId).find('.easyui-combobox').combobox({ disabled: false });
	$('#' + dlgformId).find('input').attr("disabled",false);
	$('#' + dlgformId).form('reset');
	
}

function newHrefObj(dlgId, dlghref, dlgtitle, dlgformId) {
	$('#' + dlgId).dialog({
		href:dlghref,
		title:dlgtitle,
		onLoad : function() {
			$('#' + dlgformId).form('reset');			
		}
	}).dialog('open');
}



function openLoadDlg(dlgId, dlgtitle, dlgformId, urlOrdata) {
	$('#' + dlgId).dialog({
		title:dlgtitle,
		onLoad : function() {
			$('#' + dlgformId).form('load', urlOrdata);
		}
	}).dialog('open');
}

function openHrefLoadDlg(dlgId, dlghref, dlgtitle, dlgformId, urlOrdata) {
	$('#' + dlgId).dialog({
		href:dlghref,
		title:dlgtitle,
		onLoad : function() {
			$('#' + dlgformId).form('load', urlOrdata);
			if(urlOrdata.indexOf("view")!=-1){
				$('#' + dlgformId).find('input').attr("disabled",true);
				$('#'+dlgformId).find('input').addClass("forView");
				$('#'+dlgformId).find('.easyui-combobox').combobox({ disabled: true });
				
			}else{
				$('#'+dlgformId).find('input').removeClass("forView");
				$('#' + dlgformId).find('input').attr("disabled",false);;
				$('#'+dlgformId).find('.easyui-combobox').combobox({ disabled: false });
			}			
		}
	}).dialog('open');
}

function getSelectRow(datagridId) {
	var row = $('#' + datagridId).datagrid('getSelected');
	if (row) {
		return row;
	} else {
		$.messager.alert('操作提示！', '请选择一行', 'info');
	}
}

function saveObj(datagridId, dlgId, dlgformId, url) {
	$.messager.progress(); //显示进度条
	$('#' + dlgformId).form('submit', {
		url : url,
		onSubmit : function() {
			var isValid = $(this).form('validate');
			if (!isValid){
				$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
			}
			return isValid;	// 返回false终止表单提交
		},
		success : function(result) {
			$.messager.progress('close');	// 如果提交成功则隐藏进度条
			var result = eval('(' + result + ')');
			if (result.result == "5000") {
				$.messager.show({
					title : '操作成功',
					msg : result.resultMsg
				});
				$('#' + dlgId).dialog('close'); // close the dialog
				$('#' + datagridId).datagrid('reload'); // reload data
			} else {
				$.messager.alert('操作失败', result.resultMsg, 'error');
			}
		}
	});
}

function saveTreegridObj(treegridId, dlgId, dlgformId, url) {
	$('#' + dlgformId).form('submit', {
		url : url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			var result = eval('(' + result + ')');
			if (result.result == "5000") {
				$.messager.show({
					title : '操作成功',
					msg : result.resultMsg
				});
				$('#' + dlgId).dialog('close'); // close the dialog
				$('#' + treegridId).treegrid('reload'); // reload data
			} else {
				$.messager.alert('操作失败', result.resultMsg, 'error');
			}
		}
	});
}

function destroyObj(datagridId, url) {
	$.messager.confirm('确认框', '确定删除该数据？', function(r) {
		if (r) {
			$.post(url, function(result) {
				if (result.result == "5000") {
					$.messager.show({
						title : '操作成功',
					//	msg : result.resultMsg == null ? "删除成功" : result.resultMsg
						msg : result.resultMsg == null ? "删除成功" : result.resultMsg
					});
					$('#' + datagridId).datagrid('reload'); // reload  data
				} else {
					var tmp="";
					
					if(typeof(result.related)!="undefined"){
						
						for(var i=0,len=result.related.length;i<len;i++){ //注意length可能undefined，这个也可在controller中设定固定格式消除
							if(i==0)
								tmp+="<div>"+result.related[i]+"&nbsp;&nbsp;";
							else if(i==len-1){
								tmp+=result.related[i]+"</div>";
							}else{
								tmp+=result.related[i]+";";
							}
							if(len==1){//ATT
								tmp+="</div>";
							}
						}
					}					
					$.messager.show({ // show error message
						title : '操作失败',
						//msg : result.resultMsg == null ? "删除失败，请联系管理员" : result.resultMsg
						msg : result.resultMsg == null ? "删除失败，请联系管理员" :"<div>"+result.resultMsg+"</div>"+tmp
								//尝试用parser来解决渲染问题
					});
				}
			}, 'json');
		}
	});
}

function destroyTreegridObj(treegridId, url) {
	$.messager.confirm('Confirm', '确定删除该数据及其子数据？', function(r) {
		if (r) {
			$.post(url, function(result) {
				if (result.result == "5000") {
					$.messager.show({
						title : '操作成功',
						msg : result.resultMsg == null ? "删除成功" : result.resultMsg
					});
					$('#' + treegridId).treegrid('reload'); // reload  data
				} else {
					$.messager.show({ // show error message
						title : 'Error',
						msg : result.resultMsg == null ? "删除失败，请联系管理员" : result.resultMsg
					});
				}
			}, 'json');
		}
	});
}
