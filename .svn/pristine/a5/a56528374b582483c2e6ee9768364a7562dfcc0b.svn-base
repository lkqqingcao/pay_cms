
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>用户日志列表</title>
<@common.cssFile/>
<@common.jsFile/>
</head>
  <body class="easyui-layout" >
     <!-- DataList  -->
	  <div region="center" border="false" >
     	<table id="data-list" fit="true"></table>
    </div>
    <div id="tb" style="padding:3px">
        <span>开始时间</span>
        <input id="beginTime" style="line-height:22px;width:250px;border:1px solid #ccc" class="easyui-datetimebox" />
        <span>结束时间</span>
        <input id="overTime" style="line-height:22px;width:250px;border:1px solid #ccc" class="easyui-datetimebox" />
        <span>操作内容</span>
        <input id="message" style="line-height:22px;width:250px;border:1px solid #ccc" />
        <span>APP ID</span>
        <select id="appId_s" name="appId" style="width:100px"/>
               <option value="0">ALL</option>
               <option value="1">market</option>
               <option value="2">ishow</option>
        </select>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">Search</a>
    </div>
    
  </body>
  <script type="text/javascript">
       function doSearch(){
        $('#data-list').datagrid('load',{
           'message':$('#message').val(),
           'beginTime':$('#beginTime').datebox('getValue'),
           'overTime':$('#overTime').datebox('getValue'),
           'appId':$('#appId_s').val()
        })
     }
   
      $('#data-list').datagrid({
	   			url:'${ctx}/auth/userlog/doList.json',
	   			pagination:true,
	   			singleSelect:false,
	   			pageSize:20,
                nowrap:false,
	   			rownumbers:true,
	   			pagePosition:"top",
	   			checkOnSelect:true,
	   			selectOnCheck:true,
	   			remoteSort:false,
	   			columns:[[
					{field:'id',title:'ID',width:50,sortable:true,hidden:true},
					{field:'createTime',title:'创建时间',width:200,sortable:true},
					{field:'username',title:'username',width:100,sortable:true},
					{field:'message',title:'操作信息',width:1200,sortable:true},
					{field:'type',title:'日志类型',width:50,sortable:true},
					{field:'appId',title:'应用来源',width:50,sortable:true}
				]],
				toolbar:'#tb'
      });
      
      
      
    

  </script>
</html>