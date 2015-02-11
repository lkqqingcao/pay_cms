<!DOCTYPE html>
<html lang="en-us">
<head>
<@common.header/>
<@common.css/>
</head>
<body class="">
<@common.body_header/>
<@common.nav/>
<!-- MAIN PANEL -->
<div id="main" role="main">
<!-- RIBBON -->
<div id="ribbon">
	<span class="ribbon-button-alignment">
		<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i>	Warning! This will reset all your widget settings." data-html="true">
		<i class="fa fa-refresh"></i>
	   </span>
    </span>
<!-- breadcrumb -->
<ol class="breadcrumb">
	<li>Home</li>
	<li>DashBoard</li>
</ol>
<!-- end breadcrumb -->
</div>
<!-- END RIBBON -->
<!-- MAIN CONTENT -->
<div id="content" style="height:800px;">
<div id="search">
						<form id="searchform" method="post" action="${wwwPath}diagram/findPalyPictureList.htm">
						 <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
						   <p> 						  
							    商品ID:<input type="text" name="id" value="${(PictureInfoVo.id)?if_exists}"></input>
							    商品名:<input type="text" name="name" value="${(PictureInfoVo.name)?if_exists}"></input>
							    地区:<input type="text" name="name" value="${(PictureInfoVo.name)?if_exists}"></input>
							   时间段:
							   <input type="text" class="datetimepicker" name="startdate" data-date-format="YYYY-MM-DD HH:mm:ss" id="startdate" >
							   至
							   <input type="text" class="datetimepicker" name="enddate" data-date-format="YYYY-MM-DD HH:mm:ss" id="enddate" >    
                        	<input type="submit"  value="查询"/>
						</p>
						</form>
					</div>

	           <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
						<thead>
								<tr>
                            	<th style="width:50px;">资源名称</th>	
                            	<th style="width:50px;">大类型</th>
                            	<th style="width:50px;">小类型</th>								
								<th style="width:50px;">下载量</th>
								<th style="width:50px;">价格</th>
								<th style="width:50px;">总收入</th>							
								</tr>
			  			</thead>
		       <tbody >
									 <#list ps.list as item>
										<tr>
											<td class="center"><input type="checkbox" name="selectIds"   /></td>
											<td>${item.id}</td>
											<td><#if item.auditStatus==0>未审核<#else>已审核</#if></td>
											<td>${item.apkId}</td>
											<td><#if item.mType==1>射击<#elseif item.mType==2>动作<#else>益智 </#if></td>
											<td>${(item.updateTime)?datetime}</td>
											<td><a pop="p_img" href="${uploadPath}${item.imgPath?if_exists}"><img src="${uploadPath}${item.imgPath?if_exists}" style="width:20px; height:18px;"/></a></td>
											<td>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" onclick="common.popup('${ctx}game/toEdit.htm?id=${item.id}');">修改</a>
												<a href="javascript:void(0);" class="btn btn-danger btn-xs"  onclick="if(confirm('是否确认删除?'))commonAjax('${ctx}game/doDel.htm?id=${item.id}');"">删除</a>
											</td>
										</tr>
									  </#list>
									</tbody>							
		</table>

<table >
    	<tr>
			<td>
			    <div id ='payTop10' style="width:700px"></div> 
			    <div style='text-align:center;'> <span>一周内全站下载总金额</span>
			</td>
			 <td>
			    <div id ='payarea' style="width:600px"></div>
		        <div style='text-align:center;'> <span>一周各站总下载收入</span>
		     </td>
	   </tr>
	
      <table>


</div>
<!-- END MAIN PANEL -->
<@common.footer/>
<@common.js/>
<script type="text/javascript" SRC="${ctx}/static/js/plugin/morris/morris.min.js"></script>
<script type="text/javascript" SRC="${ctx}/static/js/plugin/morris/raphael.min.js"></script>	

<script type="text/javascript">
     $(document).ready(function(){
     
     
			$.post("${ctx}/statistics/qeuryNumTop10.htm", 
			   function(data) {
			    var topdata =eval('('+data+')');  			   
			     getpayAreaTop10(eval(topdata.parnumTop));   
			});


    
     
      var tda =[ { mou: '2014-10-07', value: 230 },  
                { mou: '2014-10-08', value: 800 }, 
                { mou: '2014-10-09', value: 500 },  
                { mou: '2014-10-10', value: 1000 },   
                { mou: '2014-10-11', value: 2200 }];
                          				  
     getPayAmountTop10(tda);
     					
   function  getPayAmountTop10(topData){
		
	     new Morris.Line({  
          element: 'payTop10', 
          data:  topData,   
                 xkey: 'mou', 
                 ymax:3000, 
                 postUnits:'$',
                 xLabels:'day',
                 ykeys: ['value'],   
                 labels: ['Value'] }); 

		}
       function getpayAreaTop10(topData){
    	Morris.Bar({
						element : 'payarea',
						title:'TOP10',
						units:'$',
						data :topData ,
						xkey : 'produceName',
						ykeys : ['amountSum'],
						ymax:20, 
						pointSize:'3px',
						labels : ['Y'],
						barColors : function(row, series, type) {
							if (type === 'bar') {
								var red = Math.ceil(10 * row.y / this.ymax);
								return 'rgb(' + red + ',200,100)';
							} else {
								return '#000';
							}
						}
					}); 
  
  
  
  
              }

     })

	</script>
</body>
</html>