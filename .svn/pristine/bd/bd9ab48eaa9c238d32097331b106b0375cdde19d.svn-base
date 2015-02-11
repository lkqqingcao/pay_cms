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
<div id="content">
<div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
									<h2>Operation History</h2>
									<div class="widget-toolbar hidden-mobile">
									</div>
								</header>
								<div>
									<div class="widget-body no-padding">
										<table class="table table-striped table-hover table-condensed">
											<thead>
												<tr>
													<th>TODO</th>
													<th>TODO</th>
													<th class="text-align-center">TODO</th>
													<th class="text-align-center">TODO</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><a href="javascript:void(0);">TODO</a></td>
													<td>TODO</td>
													<td class="text-align-center">TODO</td>
													<td class="text-align-center">TODO</td>
												</tr>
											</tbody>
											<tfoot>
											</tfoot>
										</table>
										<!-- end content -->
									</div>
								</div>
								<!-- end widget div -->
							</div>
</div>
<!-- END MAIN PANEL -->
<@common.footer/>
<@common.js/>
<script type="text/javascript">
     $(document).ready(function(){
       	pageSetUp();
     })
      var common={
           popup:function(url){
                $('#iframe').attr("src",url);
                $('#iframe').attr("height",600);
                $('#myModal').find('.modal-dialog').css({
                	          'height':'auto',
                               'width':'80%'}
                               );
                $('#myModal').modal({'show':true});
           }
       }
       function checkAll(item){
                 var table= $(item).closest('table');
                 $('td input:checkbox',table).prop('checked',item.checked);
       }
		$(document).ready(function() {
            window.closeModal = function(){
                       $('#myModal').modal('hide');
            };

		})
	</script>
</body>
</html>