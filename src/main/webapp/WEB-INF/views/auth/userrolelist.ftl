
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
         <a href="${ctx}/auth/user/toList.htm" class="easyui-linkbutton" data-options="plain:true"><@spring.message "auth_user_allocaterole_return" /></a>
      </div>
	  <form id="fm" method="post" >
	    <input name="userid" value="${userid!}" hidden="true"  />
     	<table id="data-list" ></table>
      </form>
     </div>
     
     
    
    
    
  </body>
  <script type="text/javascript">
   
      $('#data-list').datagrid({
                title:'Menu List',
	   			url:'${ctx}/auth/role/getRole.json',
	   			queryParams:{userid:"${userid!}"},
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
					{field:'name',title:'<@spring.message "auth_user_allocate_column_name" />',align:'right',width:180,sortable:true},
					{field:'description',title:'<@spring.message "auth_user_allocate_column_desc" />',width:120,sortable:true},
					
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
					{id:'btnadd',text:'<@spring.message "auth_user_allocate_button_allocate" />',btnType:'add',iconCls:'icon-edit',handler:function(){
					     var rows = $('#data-list').datagrid('getChecked');
					     var ids = "";
					     for(var i=0; i<rows.length; i++){  
                            var row = rows[i];  
                            var id = row["id"];
                            if(id!="undefined"){
                               ids += id+",";
                            }
                        }  
                        $.ajax({
	                    url: "${ctx}/auth/role/doAllocateRole.json",
	                    data:{"userid":"${userid!}","ids":ids},
	                    type: 'POST',
	                    async:false,
	                    error:function(){
                           $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
	                    },
	                    success:function(result){
		                        if (result.code!=200){
		                              $.messager.show({
		                                 title: 'Error',
		                                 msg: result.msg,
		                                 timeout:5000
		                              });
		                        } else {
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
					}
				]
      });
      
      
      
     
  </script>
</html>