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
	<li>小组帖子</li>
	<li>编辑贴管理</li>
</ol>
<!-- end breadcrumb -->
</div>
<!-- END RIBBON -->
<!-- MAIN CONTENT -->
<div id="content">
	<div class="row">
		<article class="col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-5">
				<div class="no-padding">
					<div class="widget-body no-padding-btm">
						<form class="smart-form" id="searchForm" action="${ctx}topic/editor/doList.htm" method="post" >
							<fieldset>
								<div class="row">
								   	<section class="col col-2">
										<label class="input">
											<i class="icon-append fa fa-question-circle"></i>
											<input type="text" value="${(vo.id)!}" name="id" placeholder="输入帖子ID"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
												只允许精确匹配</b> 
										</label>
									</section>
								   	<section class="col col-2">
										<label class="input">
											<i class="icon-append fa fa-question-circle"></i>
											<input type="text" value="${(vo.uid)!}" name="uid" placeholder="输入用户ID"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
												只允许精确匹配</b> 
										</label>
									</section>
		
									<section class="col col-2">
										<label class="input">
											<i class="icon-append fa fa-question-circle"></i>
											<input type="text" value="${(vo.uname)!}" name="uname" placeholder="输入用户名"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
												只允许精确匹配</b> 
										</label>
									</section>
		
									<section class="col col-2">
		
										<label class="input" >
											<i class="icon-append fa fa-question-circle"></i>
											<input type="text" name="groupid" value="${(vo.groupid)!}" placeholder="输入小组ID"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
												只允许精确匹配</b> 
										</label>
									</section>
									<section class="col col-2">
		
										<label class="input" >
											<i class="icon-append fa fa-question-circle"></i>
											<input type="text" name="identifier" value="${(vo.identifier)!}" placeholder="输入小组包名"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
												只允许精确匹配</b> 
										</label>
									</section>
									 <section class="col col-2">
		                                <button class="btn btn-form btn-default btn-primary" type="submit" style="padding: 6px 12px;">
										  <i class="fa fa-search"></i>
										    Search
									      </button>
		                            </section>
								</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
		</article>
	</div>
	<!-- widget grid -->
	<section id="widget-grid" class="">
		<!-- row -->
		<div class="row">
			<!-- NEW WIDGET START -->
			<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Widget ID (each widget will need unique ID)-->
				<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
					<header>
						<span class="widget-icon">
							<i class="fa fa-table"></i>
						</span>
						<h2>新帖列表</h2>
					</header>
					<!-- widget div-->
					<div role="content" >
						<!-- widget content -->
						<div class="widget-body no-padding">
							 <div class="widget-body-toolbar" style="padding-bottom: 3px; padding-top: 3px; padding-left: 0px;">
                                 <div class="col-md-6" style="padding-left: 4px;">
                                   <a class="btn btn-primary" href="javascript:void(0);" onclick="common.popup('${ctx}topic/editor/toEdit.htm');">创建新帖</a>
                                 </div>
                             </div>
                             <div id="tableDiv" >
                              <#include "editorTopicTable.ftl">
                             </div>
						</div>
						<!-- end widget content -->
					</div>
					<!-- end widget div -->
				</div>
				<!-- end widget -->
			</article>
			<!-- WIDGET END -->
		</div>
	</section>
	<!-- end widget grid -->
</div>
<!-- END MAIN CONTENT -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					新帖编辑
				</h4>
			</div>
			<div id="modal-iframe" class="modal-body no-padding" >
               <iframe id="iframe" src="" width="100%"    scrolling="yes" style="overflow-x:hidden;" frameborder="0"></iframe>
			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</div>
<!-- END MAIN PANEL -->
<@common.footer/>
<@common.js/>
<script type="text/javascript">
      var common={
           popup:function(url){
                $('#iframe').attr("src",url);
                $('#iframe').attr("height",450);
                $('#myModal').find('.modal-dialog').css({
                	          'height':'auto',
                               'width':'80%'}
                               );
                $('#myModal').modal({'show':true});
           },
           checkAll:function(item){
                 var table= $(item).closest('table');
                 $('td input:checkbox',table).prop('checked',item.checked);
           },
           getSelected:function(){
               return   $('#_table input:checkbox:checked').map(function() {return this.value;}).get().join(',');
           },
           tableReplace:function(url){
             $.ajax({
             	url: url,
             	type: 'POST',
             	data: "extQt=1&ids="+getSelected()+"&"+$('#searchForm').serialize()
             })
             .done(function(response) {
                $('#tableDiv').html(response);
             })
             .fail(function() {
             	errorMsg("error!","操作失败");
             })
             .always(function() {
             	console.log("complete");
             });
	       }
       }
		$(document).ready(function() {
            window.closeModal = function(){
                       $('#myModal').modal('hide');
            };
            window.reloadTable = reloadTable;
		})
	</script>
</body>
</html>