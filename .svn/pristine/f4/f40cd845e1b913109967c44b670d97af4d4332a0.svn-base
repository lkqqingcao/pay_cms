
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
     
      <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px;top:100px"
                     closed="true" buttons="#dlg-buttons">
     <div class="ftitle"><@spring.message "auth_role_allocate_button_add" /></div>
              <form id="fm" method="post" novalidate="false">
                 <input name="id" type="hidden">
                 <input name="type" id="type" type="hidden">
                 <div class="fitem">
                   <label><@spring.message "auth_role_list_column_name"/></label>
                   <input id="name" name="name" class="easyui-validatebox" data-options="required:true,validType:['length[0,32]']"     invalidMessage="名称不能超过32个字符" />
                 </div>
                <div class="fitem">
                   <label><@spring.message "auth_role_allocate_column_desc" /></label>
                   <input id="description" name="description" class="easyui-validatebox" data-options="required:true,validType:['length[0,200]']" invalidMessage="描述不能超过200个字符" />
                </div>
             </form>
    </div>    
    <div id="dlg-buttons">
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">Add</a>
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
    </div>
  </body>
  <script type="text/javascript">
      $('#data-list').datagrid({
                title:'Menu List',
	   			url:'${ctx}/auth/role/getList.json',
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
					{field:'name',title:'<@spring.message "auth_role_list_column_name" />',align:'center',width:400,sortable:true},
					{field:'description',title:'<@spring.message "auth_role_list_column_desc" />',width:300,sortable:true,align:'center'},
					{field:'modify',title:'<@spring.message "auth_role_list_button_mod" />',width:200,sortable:true,align:'center',
					    formatter:function(value,row,index){
					    var id = row["id"];
						var html ="<a href='#' onclick=edit('"+id+"','"+index+"') ><@spring.message "auth_role_list_button_mod" /></a>";
						return html;
					}},
					{field:'jiaose',title:'<@spring.message "auth_role_list_column_allocate" />',width:200,align:'center',sortable:true,formatter:function(value,row,index){
					    var id = row["id"];
					    var url = "${ctx}/auth/role/toEdit.htm?id="+id;
						var html ="<a href='"+url+"' ><@spring.message "auth_user_allocate_button_allocate" /></a>";
						return html;
					}}
					
				]],
				toolbar:[
					{id:'btnadd',text:'<@spring.message "auth_role_list_button_add" />',btnType:'add',iconCls:'icon-add',handler:function(){
					      $('#dlg').dialog('open');
                          $('#fm').form('clear');
                          $('#type').val('add');
					  }
					}
				]
				
      });
      
      function edit(id,index){
           if(index=="undefined"){
               $.messager.alert('Warning','<@spring.message "error_operation_failer"/>,<@spring.message "error_form_wrong"/>');
               return;
           }
           $('#dlg').dialog('open');
           $('#fm').form('clear');
           var rows = $('#data-list').datagrid('getRows');
           var row  = rows[index];
           $('#fm').form('load',row);
           $('#type').attr({value:"edit"}); 
      }
      
      function save(){
            if(!$('#fm').form('validate')){
               $.messager.alert('Warning','<@spring.message "error_form_wrong"/>');   
               return;
            }
            var url = "";
            if($('#type').attr("value")=="edit"){
               url =  "${ctx}/auth/role/doEdit.json";
            }else{
               url =  "${ctx}/auth/role/doAdd.json";
            }
            $.ajax({
	          url: url,
	          type: 'POST',
	          async:false,
	          data:$('#fm').serialize(),
	          error:function(){
	             $('#dlg').dialog('close');   
                 $.messager.alert('Warning','<@spring.message "error_operation_failer"/>');
	          },
	          success:function(result){
                        if (result.code!=200){
                              $('#dlg').dialog('close');   
                              $.messager.show({
                                 title: 'Error',
                                 msg: result.msg,
                                 timeout:5000
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
  </script>
</html>