
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>角色列表</title>
<@common.cssFile/>
<@common.jsFile/>
</head>
  <body class="easyui-layout" >
     <!-- DataList  -->
	 <div region="center" border="false" >
     	<table id="data-list" ></table>
     </div>
     
       <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
                     closed="true" buttons="#dlg-buttons">
     <div class="ftitle"><@spring.message "auth_resource_dialog_resource" /></div>
              <form id="fm" method="post" novalidate>
                 <input name="id" type="hidden">
                 <input id="fm-type" name="type" type="hidden">
                 <div class="fitem">
                   <label><@spring.message "auth_resource_column_name" /></label>
                   <input name="name" class="easyui-validatebox" required="true">
                 </div>
                 <div class="fitem">
                   <label><@spring.message "auth_resource_column_desc" /></label>
                   <input name="description" class="easyui-validatebox" required="true">
                </div>
                <div class="fitem">
                   <label><@spring.message "auth_resource_dialog_resource" /> Pattern</label>
                   <input name="pattern" class="easyui-validatebox" required="true">
               </div>
             </form>
    </div>
    <div id="dlg-buttons">
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">Save</a>
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
    </div>
    
  </body>
  <script type="text/javascript">
     function edit(index){
            $('#fm').form('clear');
            if(index=="undefined"){
               $.messager.alert('Warning','<@spring.message "error_operation_failer"/>,<@spring.message "error_userid_not_null"/>');
               return;
           }
           $('#dlg').dialog('open');
           $('#fm').form('clear');
           var rows = $('#data-list').datagrid('getRows');
           var row  = rows[index];
           $('#fm').form('load',row);
      }
      
      function save(){
           $.ajax({
              cache:true,
	          url: '${ctx}/auth/resource/save.json',
	          type: 'POST',
	          async:false,
	          data:$('#fm').serialize(),
	          error:function(){
                $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
	          },
	          success:function(result){
                        if (result.code!=200){
                              $.messager.show({
                                 title: 'Error',
                                 msg: result.errorMsg
                              });
                        } else {
                             $('#dlg').dialog('close');   
                             $.messager.show({
                                 title: 'OK',
                                 msg: '<@spring.message "error_operation_success"/>',
                                 timeout:5000
                              });        
                             $('#data-list').datagrid('reload');    
                        }
	        }
      })
     }
  
  
  
      $('#data-list').datagrid({
                title:'Menu List',
	   			url:'${ctx}/auth/resource/getList.json',
	   			pagination:true,
	   			singleSelect:false,
	   			pageSize:20,
	   			rownumbers:true,
	   			pagePosition:"both",
	   			checkOnSelect:true,
	   			selectOnCheck:true,
	   			remoteSort:false,
	   			columns:[[
					{field:'id',title:'ID',width:50,sortable:true,hidden:true},
					{field:'name',title:'<@spring.message "auth_resource_column_name" />',align:'right',width:200,sortable:true},
					{field:'description',title:'<@spring.message "auth_resource_column_desc" />',width:200,sortable:true},
					{field:'pattern',title:'<@spring.message "auth_resource_column_pattern" />',width:100,sortable:true},
					{field:'jiaose',title:'<@spring.message "auth_resource_column_mod" />',width:200,sortable:true,formatter:function(value,row,index){
						var html ="<a href='#' onclick=edit('"+index+"') ><@spring.message "auth_resource_column_mod" /></a>";
						return html;
					}}
					
				]],
				toolbar:[
					{id:'btnadd',text:'<@spring.message "auth_resource_button_add" />',btnType:'add',iconCls:'icon-edit',handler:function(){
					    $('#dlg').dialog('open');
                        $('#fm').form('clear');
                        $('#fm-type').val("add");
					}}
				]
      });
  </script>
</html>