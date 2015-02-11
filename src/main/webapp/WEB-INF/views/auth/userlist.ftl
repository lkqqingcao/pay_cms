
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>用户列表</title>
<@common.cssFile/>
<@common.jsFile/>
</head>
  <body class="easyui-layout" >
     <!-- DataList  -->
	 <div region="center" border="false" >
     	<table id="data-list" ></table>
     </div>
     
     
     <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px;top:100px"
                     closed="true" buttons="#dlg-buttons">
     <div class="ftitle"><@spring.message "auth_user_dialog_modify" /></div>
              <form id="fm" method="post" novalidate="false">
                 <input name="id" type="hidden">
                 <input name="type" id="type" type="hidden">
                 <div class="fitem">
                   <label><@spring.message "auth_user_list_column_name" /></label>
                   <input id="name" name="name" class="easyui-validatebox" data-options="required:true,validType:['length[2,32]']"                invalidMessage="length[2-32]" />
                 </div>
                 <div class="fitem">
                   <label><@spring.message "auth_user_list_column_username"/></label>
                   <input id="username" readonly="readonly" name="username" class="easyui-validatebox" data-options="required:true,validType:['length[4,32]']"  invalidMessage="length [4-32]"    
                                 />
                    <label><@spring.message "auth_user_list_column_username_rule"/></label>
                </div>
                 <div class="fitem">
                   <label><@spring.message "auth_user_list_column_email"/></label>
                   <input id="email" name="email" class="easyui-validatebox" data-options="required:true,validType:['length[0,64]','email']"      invalidMessage="invalid email"  />
                </div>
                <div class="fitem">
                   <label><@spring.message "auth_user_list_column_desc"/></label>
                   <input id="description" name="description" class="easyui-validatebox" data-options="validType:['length[0,200]']" invalidMessage="length[0,200]" />
                </div>
             </form>
    </div>    
    <div id="dlg-buttons">
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">Save</a>
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
    </div>
    
    
  </body>
  <script type="text/javascript">
      $('#role-list').combogrid({
            panelWidth: 240,
            multiple: true,
            idField: 'id',
            textField: 'name',
            method: 'post',
            columns: [[
                {field:'ck',checkbox:true},
                {field:'id',title:'ID',width:0,hidden:true},
                {field:'name',title:'<@spring.message "auth_role_name" />',width:120},
                {field:'description',title:'<@spring.message "auth_user_list_column_desc"/>',width:120},
            ]],
            fitColumns: true
      })
  
   
      $('#data-list').datagrid({
	   			url:'${ctx}/auth/user/getList.json',
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
					{field:'name',title:'<@spring.message "auth_user_list_column_name" />',width:150,sortable:true},
					{field:'username',title:'<@spring.message "auth_user_list_column_username" />',width:200,sortable:true},
					{field:'email',title:'<@spring.message "auth_user_list_column_email" />',align:'right',width:180,sortable:true},
					{field:'description',title:'<@spring.message "auth_user_list_column_desc" />',width:120,sortable:true},
					{field:'enable',title:'<@spring.message "auth_user_list_column_status" />',width:120,sortable:true,formatter:function(value,row,index){
					    if(value==1){
					        return "<@spring.message "auth_user_list_column_enable" />";
					    }else if(value==0){
					        return "<@spring.message "auth_user_list_column_disable" />";
					    }
					}},
					{field:'modify',title:'<@spring.message "auth_user_list_column_modify" />',width:100,align:'center',formatter:function(value,row,index){
					    var id = row["id"];
						var html ="<a href='#' onclick=edit('"+id+"','"+index+"') ><@spring.message "auth_user_list_column_modify" /></a>";
						return html;
					}},
					{field:'qiyong',title:'<@spring.message "auth_user_list_column_enable" />',width:100,align:'center',formatter:function(value,row,index){
					    var id = row["id"];
						var html ="<a href='#' onclick=enable('"+id+"','"+index+"') ><@spring.message "auth_user_list_column_enableor" /></a>";
						return html;
					}},					
					{field:'reset',title:'<@spring.message "auth_user_list_column_resetpasswd" />',width:100,align:'center',formatter:function(value,row,index){
					    var id = row["id"];
						var html ="<a href='#' onclick=reset('"+id+"') ><@spring.message "auth_user_list_column_resetpasswd" /></a>";
						return html;
					}},	
					{field:'roleAllocate',title:'<@spring.message "auth_user_list_column_allocate" />',width:100,align:'center',formatter:function(value,row,index){
					    var id = row["id"];
					    var url = "${ctx}/auth/role/toUserRole.htm?userid="+id;
						var html ="<a href='"+url+"' ><@spring.message "auth_user_list_column_allocate" /></a>";
						return html;
					}}
				]],
				toolbar:[
					{id:'btnadd',text:'<@spring.message "auth_user_list_button_add" />',btnType:'add',iconCls:'icon-add',handler:function(){
					      $('#dlg').dialog('open');
                          $('#fm').form('clear');
                          $('#type').val('add');
                          $('#username').removeAttr("readonly");
					  }
					}
				]
				
      });
      
      
      
      function edit(id,index){
           if(index=="undefined"){
               $.messager.alert('Warning','<@spring.message "error_operation_failer"/>,<@spring.message "error_userid_not_null"/>');
               return;
           }
           $('#dlg').dialog('open');
            $('#username').attr("readonly","readonly");
           $('#fm').form('clear');
           var rows = $('#data-list').datagrid('getRows');
           var row  = rows[index];
           $('#fm').form('load',row);
      }
      
      function save(){
            if(!$('#fm').form('validate')){
               $.messager.alert('Warning','<@spring.message "error_form_wrong"/>');   
               return;
            }
            $.ajax({
	          url: "${ctx}/auth/user/doEdit.json",
	          type: 'POST',
	          async:false,
	          data:$('#fm').serialize(),
	          error:function(){
	             $('#dlg').dialog('close');   
                 $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
	          },
	          success:function(result){
	                    $('#dlg').dialog('close'); 
                        if (result.code==201){
                              $.messager.show({title: 'Error',msg:'<@spring.message "error_wrong_username_name"/>',timeout:5000});
                        } else if(result.code==200) {
                             $.messager.show({
                                 title: 'OK',
                                 msg: '<@spring.message "error_operation_success"/>',
                                 timeout:5000
                              });          
                             $('#data-list').datagrid('reload');    
                        }else if(result.code=222){
                             $.messager.show({title: 'Error',msg:'<@spring.message "error_wrong_username_name_dup"/>',timeout:5000});
                        }
                        else {
                            $.messager.show({title: 'Error',msg:'<@spring.message "error_wrong_operation_link_admin"/>',timeout:5000});                           
                        
                        }
	        }
      })
      
      }
      
      
      function enable(id,index){
          if(id=="undefined"){
             $.messager.alert('Warning','<@spring.message "error_operation_failer"/>,<@spring.message "error_userid_not_null" />');
             return;
          }
          var enable = $('#data-list').datagrid('getRows')[index]['enable'];
          if(enable==1){
             enable=0;
          }else{
             enable=1;
          }
          $.ajax({
             url:"${ctx}/auth/user/enable.json",
             type:'POST',
             async:false,
             data:{"userid":id,"enable":enable},
              error:function(){
                 $.messager.alert('Warning','<@spring.message "error_operation_failer" />');
	          },     
              success:function(data){
                    //var result =  eval("("+data+")");
                    var result =  data;
                    if(result.code==200){
                        $.messager.show({
                                 title: 'OK',
                                 msg: '<@spring.message "error_operation_success"/>',
                                 timeout:5000
                              });
                        $('#data-list').datagrid('getRows')[index]['enable']=enable;
                        $('#data-list').datagrid('refreshRow',index);
                    }else{
                        $.messager.show({
                                 title: 'ERROR',
                                 msg: result.msg,
                                 timeout:5000
                              });
                    }
               }
          })
      
      }
      
      function reset(id){
          if(id=="undefined"){
             $.messager.alert('Warning','<@spring.message "error_operation_failer"/>,<@spring.message "error_userid_not_null"/>');
             return;
          }
           $.ajax({
             url:"${ctx}/auth/user/reset.json",
             type:'POST',
             async:false,
             data:{"userid":id},
             error:function(){
                 $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
	          },     
              success:function(data){
                    //var result =  eval("("+data+")");
                    var result =  data;
                    if(result.code==200){
                        $.messager.show({
                                 title: 'OK',
                                 msg: '<@spring.message "error_operation_success"/>/>',
                                 timeout:5000
                              });
                    }else{
                        $.messager.show({
                                 title: 'ERROR',
                                 msg: result.msg,
                                 timeout:5000
                              });
                    }
               }
          })
      }
  </script>
</html>