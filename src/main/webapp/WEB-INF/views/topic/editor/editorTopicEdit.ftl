<!DOCTYPE html>
<html lang="en-us">
<head>
<@common.header/>
<@common.css/>
<style type="text/css">
body{
    overflow-x:hidden;
    height:100%;
}
</style>
</head>
<body>

 
<section>
   <form id="editForm" enctype="multipart/form-data" class="smart-form" novalidate="novalidate" method="post" action="${ctx}topic/editor/doEdit.htm">
   	                        <input type="text" hidden="true" name="id" value="${(vo.id)!}" >
						<!--站点类型，内容，图片，用户名 -->

							<fieldset>
								<div class="row">
									<section class="col col-3">
										<label class="select">
											<select id="site" name="site" <#if (vo.site)??>disabled="disabled"</#if>>
												<option value="-1" selected="" disabled="">站点类型</option>
												   <option value="gl" <#if (vo.site)??&&(vo.site)=='gl'>selected</#if> >gl-全球</option>
    								               <option value="vn" <#if (vo.site)??&&(vo.site)=='vn'>selected</#if> >vn-越南</option>
									               <option value="id" <#if (vo.site)??&&(vo.site)=='id'>selected</#if> >id-印度尼西亚</option>
									               <option value="th" <#if (vo.site)??&&(vo.site)=='th'>selected</#if> >th-泰国</option>
									               <option value="in" <#if (vo.site)??&&(vo.site)=='in'>selected</#if> >in-印度</option>
									               <option value="me" <#if (vo.site)??&&(vo.site)=='me'>selected</#if> >me-中东地区</option>
									               <option value="ru" <#if (vo.site)??&&(vo.site)=='ru'>selected</#if> >ru-俄罗斯</option>
									               <option value="br" <#if (vo.site)??&&(vo.site)=='br'>selected</#if> >br-巴西</option>
									               <option value="na" <#if (vo.site)??&&(vo.site)=='na'>selected</#if> >na-北美</option>
									               <option value="es" <#if (vo.site)??&&(vo.site)=='es'>selected</#if> >es-墨西哥</option>
									               <option value="hk" <#if (vo.site)??&&(vo.site)=='hk'>selected</#if> >hk-香港</option>
									               <option value="tr" <#if (vo.site)??&&(vo.site)=='tr'>selected</#if> >tr-土耳其</option>
											</select> <i></i> </label>
											 <#if (vo.site)??><input type="hidden" name="site" value="${vo.site}" /></#if>
									</section>
									<section class="col col-3">
									         <label class="select">
											<select id="uid" name="uid" <#if (vo.uid)??>disabled="disabled"</#if>>
												<#if (vo.uid)??>
												   <option value="-1"  disabled="">用户名</option>
												   <option value="${vo.uid}"  selected="">${vo.uname}</option>
												<#else>
												   <option value="-1"  disabled="">用户名</option>
												</#if>
											</select> <i></i> </label>
											  <#if (vo.uid)??> <input type="hidden" name="uid" value="${vo.uid}" /> </#if>
									</section>
									<section class="col col-6">
										<label class="input">
											<i class="icon-append fa fa-question-circle"></i>
											<input name="groupid"  value="${(vo.groupid)!}"  type="text" placeholder="请输入小组ID，小组ID可以从小组管理中查询得到">
											<b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										     请输入小组ID</b>
										</label>
									</section>
								</div>
								<section>
									<label class="textarea"> <i class="icon-append fa fa-comment"></i> 										
										<textarea rows="5" name="topicContent"  placeholder="请输入话题内容，限制最多800个字符">${(vo.topicContent)!}</textarea> 
											<b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										     请输入话题内容</b>
									</label>
								</section>
							</fieldset>
						    <fieldset>
                                <div class="row">
                                    <section class="col col-5">
									   <div class="input input-file">
										    <span class="button"><input id="file" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
										    </span><input type="text" placeholder="Include some files" readonly="">
										    
									   </div>
                                    </section>
                                    <!-- <section class="col">
									   <a style="padding: 6px 12px;" class="btn btn-primary" href="javascript:void(0);" onclick="startUpload();">上传</a>
                                    </section> -->
                                     <section class="col col-6">
									    <#if (vo.topicLeavePic)??>
									       <img src="${vo.topicLeavePic}" width="100" height="100"/>
                                        </#if>
                                    </section>
                                </div>
							</fieldset>

							<footer>
								<button type="submit" class="btn btn-primary">
	        					<i class="fa fa-save"></i>
								Submit
								</button>
								<button type="button" onclick="closeModal();" class="btn btn-default">
     							Cancel
								</button>
								
													
							</footer>
						</form>
           </section>
				


		<@common.js/>
<script type="text/javascript">
        var msg = "${(vo.msg)!}";

		function closeModal(){
			window.parent.closeModal();
			return false;
		}
		
	function ajax(url,data){
	       $.post(url,data,function(ret){
	         if(!ret||JSON.parse(ret).code!=200){
	           errorMsg("error!","操作失败");
	         }else{
	           successMsg("success!","操作成功");
	           reloadTable();
	         }
	       })
	}
	
		
	$(document).ready(function() {
		$("#site").change(function() {
		   $.post("${ctx}topic/editor/doListMajias.htm",
		   		{site: $("#site option:selected").val()},
		   		function(data){
				     if(!data||JSON.parse(data).code!=200){
				       errorMsg("error!","操作失败");
				     }else{
				     	$("#uid").html("").append("<option  disabled=''>用户名</option>");
			     	 	var jsonData = eval("("+data+")");
		                $.each(jsonData.data, function(index, item) {
		                	//$("#uid").append("<option value='"+item['uid']+"'>"+item['nickname']+"</option>");
		                	$("<option>").attr("value", item["uid"]).html(item["nickname"]).appendTo($("#uid"));  
		                });  
				     }
		   });
		});
		
			var $editForm = $("#editForm").validate({
				// Rules for form validation
				rules : {
					site : {
						required : true
					},
					uid : {
						required : true
					},
					groupid : {
						required : true
					},
					topicContent:{
					   rangelength:[0,800]
					}
					
				},
				messages : {
					site : {
						required : 'Please select a site'
					},
					uid : {
						required : 'Please select an uid'
					},
					groupid : {
						required : 'Please enter a groupid'
					},
					topicContent:{
					    rangelength:'字数要少于140'
					}
				},
				// Do not change code below
				errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				}
			});

			
			if(!msg){
			  console.log("no op");
			}
			else if(msg=="success"){
			  successMsg("success","操作成功");
			  window.parent.reloadTable();
		    }else if(msg=="error"){
			  errorMsg("error","操作失败");
			}else {
			  errorMsg("error",msg);
			}
		})
		</script>
	</body>
</html>