<!DOCTYPE html>
<html lang="en-us">
<head>
<@common.header/>
<@common.css/>
</head>
<body>
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
	<li>Tables</li>
	<li>Data Tables</li>
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
				<form class="smart-form" id="searchForm" action="${ctx}game/doList.htm" method="post" >
					<fieldset>
						<div class="row">

							<section class="col col-2">
								<label class="input">
									<i class="icon-append fa fa-calendar"></i>
									<input type="text" name="extStartTimeStr" <#if (vo.extStartTimeStr)?? >value="${vo.extStartTimeStr}"</#if>  data-date-format="YYYY-MM-DD HH:mm:ss" class="datetimepicker" placeholder="起始时间"></label>
							</section>
							<section class="col col-2">
								<label class="input">
									<i class="icon-append fa fa-calendar"></i>
									<input type="text" name="extEndTimeStr"  <#if  (vo.extEndTimeStr)??  >value="${vo.extEndTimeStr}"</#if> data-date-format="YYYY-MM-DD HH:mm:ss" class="datetimepicker" placeholder="结束时间"></label>
							</section>

							<section class="col col-2">
								<label class="select">
									<select name="mType">
										<option value="-1">选择游戏类型</option>
										<option <#if (vo.mType)??&&(vo.mType)==1>selected</#if> value="1">射击</option>
										<option <#if (vo.mType)??&&(vo.mType)==2>selected</#if> value="2">动作</option>
										<option <#if (vo.mType)??&&(vo.mType)==3>selected</#if> value="3">益智</option>
									</select>
									<i></i>
								</label>
							</section>

							<section class="col col-2">

								<label class="select">
									<select name="auditStatus">
										<option value="-1">选择审核状态</option>
										<option <#if (vo.auditStatus)??&&(vo.auditStatus)==1>selected</#if> value="1">已审核</option>
										<option <#if (vo.auditStatus)??&&(vo.auditStatus)==0>selected</#if>value="0">未审核</option>
									</select>
									<i></i>
								</label>
							</section>
							<section class="col col-2">

								<label class="input">
									<i class="icon-append fa fa-question-circle"></i>
									<input type="text" value="${(vo.apkId)!}" name="apkId" placeholder="输入包名"> <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										只允许左模糊匹配</b> 
								</label>
							</section>
							<section class="col col-2">

								<label class="input" >
									<i class="icon-prepend fa fa-question-circle"></i>
									<input type="text" name="imgPath" value="${(vo.imgPath)!}" placeholder="输入图片路径"> <b class="tooltip tooltip-left"><i class="fa fa-warning txt-color-teal"></i>
										只允许精确匹配</b> 
								</label>
							</section>
						</div>
						<div class="row">
							<section class="col col-2">

								<label class="input">
									<i class="icon-append  fa fa-question-circle"></i>
									<input type="text" placeholder="输入用户名称">
									<b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										只允许精确匹配</b> 
								</label>
							</section>
							<section class="col col-8">
								<div class="inline-group">
									<label class="checkbox">
										<input type="checkbox" name="isDeleted" <#if (vo.isDeleted)??&&(vo.isDeleted)==1>checked="checked"</#if> value="1" name="checkbox-inline">
										<i></i>
										已删除
									</label>
									<label class="checkbox">
										<input type="checkbox" name="checkbox-inline">
										<i></i>
										Alice
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
							<h2>Game List</h2>
						</header>
						<!-- widget div-->
						<div role="content" >
							<!-- widget content -->
							<div class="widget-body no-padding">
								 <div class="widget-body-toolbar" style="padding-bottom: 3px; padding-top: 3px; padding-left: 0px;">
                                     <div class="col-md-6" style="padding-left: 4px;">
                                       <a class="btn btn-primary" href="javascript:void(0);">静态化</a>
                                       <a class="btn btn-success"  href="javascript:void(0);">通过</a>
                                       <a class="btn btn-danger"  href="javascript:void(0);">置为垃圾</a>
                                       <div class="btn-group">
                                           <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">审核 <span class="caret"></span>
                                                 </button>
                                           <ul class="dropdown-menu">
                                               <li>
                                                   <a href="javascript:void(0);">通过</a>
                                               </li>
                                               <li>
                                                   <a href="javascript:void(0);">退回</a>
                                               </li>
                                               <li>
                                                   <a href="javascript:void(0);">Something else here</a>
                                              </li>
                                              <li class="divider"></li>
                                              <li>
                                                 <a href="javascript:void(0);">Separated link</a>
                                              </li>
                                         </ul>
                                    </div>
                                       <a class="btn  bg-color-magenta txt-color-white" onclick="common.popup('${ctx}game/toEdit.htm');" href="javascript:void(0);">添加</a>
                                     </div>
                                 </div>
                                 <div id="tableDiv" >
                                  <#include "gameTable.ftl">
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

			<!-- end row -->

			<!-- end row -->

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
					游戏编辑
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
                $('#iframe').attr("height",600);
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
           getSelectedId:function(){
               return   $("#_table input:checkbox[name='selectIds']:checked").map(function() {return this.value;}).get().join(',');
           }
       }
       
       
		$(document).ready(function() {
			

            window.closeModal = function(){
                       $('#myModal').modal('hide');
            };

		})

		



	</script>
</body>
</html>