<#macro css>
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/smartadmin-skins.min.css">
<!-- customization css -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/your_style.css">
<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/demo.min.css">
<!-- FAVICONS -->
<link rel="shortcut icon" href="${ctx}/static/img/favicon/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctx}/static/img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${ctx}/static/css/google-fonts.css">
<link rel="stylesheet" href="${ctx}/static/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${ctx}/static/css/pop.css">
</#macro>

<#macro js>
<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="${ctx}/static/js/plugin/pace/pace.min.js"></script>
<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="${ctx}/static/js/jquery-2.1.1.js"></script>
<script src="${ctx}/static/js/jquery-ui.js"></script>
<!-- IMPORTANT: APP CONFIG -->
<script src="${ctx}/static/js/app.config.js"></script>
<!-- BOOTSTRAP JS -->
<script src="${ctx}/static/js/bootstrap/bootstrap.min.js"></script>
<!-- CUSTOM NOTIFICATION -->
<script src="${ctx}/static/js/notification/SmartNotification.min.js"></script>
<!-- JARVIS WIDGETS -->
<script src="${ctx}/static/js/smartwidgets/jarvis.widget.min.js"></script>
<!-- EASY PIE CHARTS -->
<script src="${ctx}/static/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
<!-- SPARKLINES -->
<script src="${ctx}/static/js/plugin/sparkline/jquery.sparkline.min.js"></script>
<!-- JQUERY VALIDATE -->
<script src="${ctx}/static/js/plugin/jquery-validate/jquery.validate.min.js"></script>
<!-- JQUERY MASKED INPUT -->
<script src="${ctx}/static/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<!-- JQUERY SELECT2 INPUT -->
<script src="${ctx}/static/js/plugin/select2/select2.min.js"></script>
<!-- JQUERY UI + Bootstrap Slider -->
<script src="${ctx}/static/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
<!-- browser msie issue fix -->
<script src="${ctx}/static/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
<!-- FastClick: For mobile devices -->
<script src="${ctx}/static/js/plugin/fastclick/fastclick.min.js"></script>
<!--[if IE 8]>
<h1>
Your browser is out of date, please update your browser by going to www.microsoft.com/download
</h1>
<![endif]-->
<!-- Demo purpose only -->
<script src="${ctx}/static/js/demo.min.js"></script>
<!-- MAIN APP JS FILE -->
<script src="${ctx}/static/js/app.min.js"></script>
<!-- PAGE RELATED PLUGIN(S) -->
<script src="${ctx}/static/js/moment.js"></script>
<script src="${ctx}/static/js/datetimepicker.js"></script>
<script src="${ctx}/static/js/common.js"></script>
<script src="${ctx}/static/js/jquery.storageapi.js"></script>
<script type="text/javascript" >
    function resizeIframe(obj) {
         obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    }

     function successMsg(title,content){
          $.smallBox({
					title : title,
					content : content,
					color : "#02C874",
					iconSmall : "fa fa-thumbs-up bounce animated",
					timeout : 8000
				});
		
    }

   function errorMsg(title,content){
            $.smallBox({
					title : title,
					content : content,
					color : "#AE0000",
					iconSmall : "fa fa-thumbs-down bounce animated",
					timeout : 8000
				});
    }

    function nextPage(pageNum,pageSize){
           var url = $('#searchForm').attr('action');
           var data = "pageNum="+pageNum+"&pageSize="+pageSize+"&extQt=1&"+$('#searchForm').serialize(); 
           tableAjax(url,data);
	}
	
	
	function samplePage(firstId,lastId,pageSize){
	       var url = $('#searchForm').attr('action');
	       var data = "firstId="+firstId+"&lastId="+lastId+"&pageSize="+pageSize+"&extQt=1&"+$('#searchForm').serialize(); 
	       tableAjax(url,data);
	
	}
	function tableAjax(url,data){
	         $.ajax({
             	url: url,
             	type: 'POST',
             	data:data
             })
             .done(function(response) {
                $('#tableDiv').html(response);
                setupTip();
                pageSetUp();
                $.localStorage.set("c-table-url",url);
                $.localStorage.set("c-table-data",data);
             })
             .fail(function() {
             	errorMsg("error!","操作失败");
             })
             .always(function() {
             	console.log("complete");
             });
	}
	
	function commonAjax(url,data){
	       $.post(url,data,function(ret){
	         if(!ret||JSON.parse(ret).code!=200){
	           var msg = JSON.parse(ret).msg;
	           errorMsg("error!",msg?msg:"操作失败");
	         }else{
	           successMsg("success!","操作成功");
	           reloadTable();
	         }
	       })
	}
	
	function reloadTable(){
	    var url  =  $.localStorage.get("c-table-url");
        var data = $.localStorage.get("c-table-data");
        if(!url||!data){window.location.reload(true);return;}
        tableAjax(url,data);
	}



   
   $(document).ready(function() {
		pageSetUp();
		$.localStorage.remove("c-table-url");
		$.localStorage.remove("c-table-data");

 //http://eonasdan.github.io/bootstrap-datetimepicker/#options
   $('.datetimepicker').datetimepicker({
    	useSeconds: true,
        pick12HourFormat: false,
	    useCurrent: false
   });
   
   var lastUrl ="";
   if(window.localStorage && $.localStorage.get("lastUrl")){
      lastUrl = $.localStorage.get("lastUrl");
      var setmenu = $.localStorage.get("sm-setmenu");
      var target =  $(".remember a[href='"+lastUrl+"']");
      if(target&&lastUrl==$(location).attr('pathname')){
         $(target).parent().addClass("active");
         if(setmenu!="top"){
            $(target).parent().parent().css("display","block");
         }
         $(target).parent().parent().parent().addClass("open");
      }
   }
   
   if(window.localStorage && $.localStorage.get("smart-style")){
        var a = $('#'+$.localStorage.get("smart-style")),
        b = $("#logo img");
        $.root_.removeClassPrefix("smart-style").addClass(a.attr("id"));
        b.attr("src", a.data("skinlogo"));
        $("#smart-styles > a #skin-checked").remove();
        a.prepend("<i class='fa fa-check fa-fw' id='skin-checked'></i>");
   }
   
   $(".remember ul li ul li a").click(function(){
       var href = $(this).attr("href");
       $.localStorage.remove("lastUrl");
       $.localStorage.set("lastUrl",href);
   });
   
   
 })

</script>
</#macro>

<#macro nav>
<aside id="left-panel">
	<div class="login-info">
		<span>
			<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
				<img src="${ctx}static/img/avatars/4.png" alt="me" class="online" />
				<span>${(user.name)!}</span>
				<i class="fa fa-angle-down"></i>
			</a>
		</span>
	</div>
	<nav class="remember">
	<ul>
		<li>
			<a href="${ctx}index/dashboard.htm" title="Dashboard">
				<i class="fa fa-lg fa-fw fa-home"></i>
				<span class="menu-item-parent">Dashboard</span>
			</a>
		</li>
		<li>
			<a href="#">
				<i class="fa fa-lg fa-fw fa-cc-visa"></i>
				<span class="menu-item-parent">付费下载</span>
			</a>
			<ul>
			    <li>
					<a href="${ctx}pay/price/doList.htm">定价管理</a>
				</li>
				<li>
					<a href="${ctx}pay/order/doList.htm">订单管理</a>
				</li>
				<li>
					<a href="${ctx}statistics/qeuryAmouTop10.htm">统计管理</a>
				</li>
			</ul>
		</li>
		<li >
			<a href="#" >
				<i class="fa fa-lg fa-fw fa-table"></i>
				<span class="menu-item-parent">Tables</span>
			</a>
			<ul>
				<li>
					<a href="${ctx}game/doList.htm">IOS GAME</a>
				</li>
			</ul>
		</li>
	</ul>
</nav>
<span class="minifyme" data-action="minifyMenu">
	<i class="fa fa-arrow-circle-left hit"></i>
</span>
</aside>
</#macro>

<#macro header>
<meta charset="utf-8" />
<title>MOBOGENIE CMS</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</#macro>

<#macro body_header>
<header id="header">
		<div id="logo-group">
			<span id="logo">
				<img src="${ctx}static/img/logo-mb.png" alt="Order CMS" style="margin-top: -5px;">
			</span>
	</div>
	<div class="pull-right">
		<div id="hide-menu" class="btn-header pull-right">
			<span>
				<a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu">
					<i class="fa fa-reorder"></i>
				</a>
			</span>
		</div>
		<div id="logout" class="btn-header transparent pull-right">
			<span>
				<a href="${ctx}j_spring_security_logout" title="Sign Out" data-action="userLogout" data-logout-msg="确认登出CMS系统?">
					<i class="fa fa-sign-out"></i>
				</a>
			</span>
		</div>
		<!-- end input: search field -->
		<!-- fullscreen button -->
		<div id="fullscreen" class="btn-header transparent pull-right">
			<span>
				<a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen">
					<i class="fa fa-arrows-alt"></i>
				</a>
			</span>
		</div>
		<ul class="header-dropdown-list hidden-xs">
			<li>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="/static/img/blank.gif" class="flag flag-us" alt="United States">
					<span>English (US)</span>
					<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu pull-right">
					<li class="active">
						<a href="javascript:void(0);">
							<img src="/static/img/blank.gif" class="flag flag-us" alt="United States">English (US)</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<img src="/static/img/blank.gif" class="flag flag-cn" alt="China">中文</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</header>
</#macro>


<#macro footer>
<div class="page-footer">
	<div class="row">
		<div class="col-xs-12 col-sm-6">
			<span class="txt-color-white">Mobogenie Cms © 2013-2020</span>
		</div>
	</div>
</div>
</#macro>

<#macro spaging sp>
<div class="dt-toolbar-footer">
	
	    <div class="col-xs-12 col-sm-6">
	    	 <div class="dataTables_paginate paging_simple_numbers" id="dt_basic_paginate">
	    	   <ul class="pagination pagination-sm">
	    	   
	    	    <#if sp.hasPrevious==false>
	    	 	<li class="paginate_button previous disabled" aria-controls="dt_basic" tabindex="0" id="dt_basic_previous"><a href="javascript:void(0)" >Previous</a></li>
	    	 	<#else>
	    	 	<li class="paginate_button previous" aria-controls="dt_basic" tabindex="0" id="dt_basic_previous"><a href="javascript:void(0)"  onclick="samplePage('${(sp.firstId)!}','',${sp.pageSize});" >Previous</a></li>
	    	 	</#if>
	    	 	
	       
		        <#if sp.hasNext==false>
	    	 	  <li class="paginate_button next disabled" aria-controls="dt_basic" tabindex="0" id="dt_basic_next"><a href="javascript:void(0)" >Next</a></li>
	    	    <#else>
	    	 	  <li class="paginate_button next" aria-controls="dt_basic" tabindex="0" id="dt_basic_next"><a href="javascript:void(0)"  onclick="samplePage('','${(sp.lastId)!}',${sp.pageSize});" >Next</a></li>
	    	    </#if>
	    	 	
	    	  </ul>
	    	 </div>
	    	</div>
	    </div>
</#macro>

<#macro paging pagination>
    <div class="dt-toolbar-footer">
		<div class="col-sm-6 col-xs-12 hidden-xs">
			<div class="dataTables_info" id="dt_basic_info" role="status" aria-live="polite">
			<#if pagination.totalCount gt 0>
				Showing <span class="txt-color-darken">${pagination.startIndex}</span> 
				        to <span class="txt-color-darken">${pagination.endIndex}</span>
				        of <span class="text-primary">${pagination.totalCount}</span>
				         entries
		    </#if>
		    </div>
		</div>
	    <div class="col-xs-12 col-sm-6">
	    	 <div class="dataTables_paginate paging_simple_numbers" id="dt_basic_paginate">
	    	   <ul class="pagination pagination-sm">
	    	   
	    	    <#if pagination.firstPage==true>
	    	 	<li class="paginate_button previous disabled" aria-controls="dt_basic" tabindex="0" id="dt_basic_previous"><a href="javascript:void(0)" onclick="nextPage(${pagination.previousPage},${pagination.pageSize});" >Previous</a></li>
	    	 	<#else>
	    	 	<li class="paginate_button previous" aria-controls="dt_basic" tabindex="0" id="dt_basic_previous"><a href="javascript:void(0)"  onclick="nextPage(${pagination.previousPage},${pagination.pageSize});" >Previous</a></li>
	    	 	</#if>
	    	 	
	    	 	<#list pagination.pages as page>
				<#if page?if_exists==0>
				<li class="paginate_button disabled" aria-controls="dt_basic" tabindex="0" id="dt_basic_ellipsis"><a href="#">…</a></li>
				<#else>
					<#if pagination.pageNum==page>
						<li class="paginate_button  active"  aria-controls="dt_basic" tabindex="0"   ><a href="javascript:void(0)">${page}</a></li>
					<#else>
						<li class="paginate_button " aria-controls="dt_basic" tabindex="0"><a href="javascript:void(0)"  onclick="nextPage(${page},${pagination.pageSize});" >${page}</a></li>
					</#if>
				 </#if>
		       </#list>
	       
		        <#if pagination.endPage==true>
	    	 	  <li class="paginate_button next disabled" aria-controls="dt_basic" tabindex="0" id="dt_basic_next"><a href="javascript:void(0)" >Next</a></li>
	    	    <#else>
	    	 	  <li class="paginate_button next" aria-controls="dt_basic" tabindex="0" id="dt_basic_next"><a href="javascript:void(0)"  onclick="nextPage(${pagination.nextPage},${pagination.pageSize});" >Next</a></li>
	    	    </#if>
	    	 	
	    	  </ul>
	    	 </div>
	    	</div>
	    </div>
</#macro>