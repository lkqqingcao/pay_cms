
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>用户角色列表</title>
<@common.cssFile/>
<@common.jsFile/>
</head>
  <body class="easyui-layout" >
     <!-- DataList  -->
	 <div region="center" border="false" >
	  <div style="margin:20px 0;"></div>
      <div class="easyui-panel" style="padding:5px;">
         <a href="${ctx}/auth/role/toList.htm" class="easyui-linkbutton" data-options="plain:true"><@spring.message "auth_role_allocate_return" /></a>
      </div>
	  <form id="fm" method="post" >
	    <input name="roleid" value="${roleId!}" hidden="true"  />
     	<table id="data-list" ></table>
      </form>
     </div>
     
     
    
    
    
  </body>
  <script type="text/javascript">
   
      $('#data-list').datagrid({
                title:'Menu List',
	   			url:'${ctx}/auth/resource/getRoleRs.json',
	   			queryParams:{"roleId":"${roleId!}"},
	   			pagination:true,
	   			singleSelect:false,
	   			pageSize:100,
	   			pageList:[100],
	   			rownumbers:true,
	   			pagePosition:"both",
	   			checkOnSelect:true,
	   			selectOnCheck:true,
	   			remoteSort:false,
	   			columns:[[
	   			    {field:'ck',checkbox:true},
					{field:'id',title:'ID',width:50,sortable:true,hidden:true},
					{field:'pattern',title:'<@spring.message "auth_role_allocate_column_pattern" />',align:'right',width:180,sortable:true},
					{field:'name',title:'<@spring.message "auth_role_allocate_column_resourcename" />',align:'right',width:180,sortable:true},
					{field:'description',title:'<@spring.message "auth_role_allocate_column_desc" />',width:120,sortable:true},
					
				]],
			    onLoadSuccess:function(data){                    
                  if(data){
                        $.each(data.rows, function(index, item){
                           if(item.hasit){
                               $('#data-list').datagrid('checkRow', index);
                           }
                        })
                   }
               },
               toolbar:[
					{id:'btnadd',text:'<@spring.message "auth_role_allocate_column_allocate" />',btnType:'add',iconCls:'icon-add',handler:function(){
					     var rows = $('#data-list').datagrid('getChecked');
					     var ids = "";
					     for(var i=0; i<rows.length; i++){  
                            var row = rows[i];  
                            var id = row["id"];
                            if(id!="undefined"){
                               ids += id+",";
                            }
                        }  
                        $.post("${ctx}/auth/resource/doAllocateRs.json",
                             {"ids":ids,"roleId":"${roleId!}"},function(data,status){
                                    if(data.code==200){
                                         $.messager.alert('Warning','<@spring.message "error_operation_success"/>');
                                         $('#data-list').datagrid('reload');                                         
                                     }else{
                                          $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
                              }  });                
					  }
					}
				]
      });
      
      
      
     
  </script>
</html>