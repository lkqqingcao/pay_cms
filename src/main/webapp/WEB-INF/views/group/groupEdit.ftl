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
   <form id="editForm" enctype="multipart/form-data" class="smart-form" novalidate="novalidate" method="post" action="${ctx}group/doEdit.htm">
   	                        <input type="text" hidden="true" name="id" value="${(vo.id)!}" >
						<!--站点类型，内容，图片，用户名 -->
							<fieldset>
								<div class="row">
									<section class="col col-3">
										<label class="select">
											<select name="site">
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
											</select> <i></i>
										       </label>
									</section>
									<section class="col col-3">
										<label class="input">
											<i class="icon-append fa fa-question-circle"></i>
											<input name="groupName"  value="${(vo.groupName)!}"  type="text" placeholder="请输入小组名称">
                                            <b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										     请输入小组名称</b> 
										</label>
									</section>
									<section class="col col-5">
										<label class="input">
												<i class="icon-append fa fa-question-circle"></i>
											<input name="identifier"  value="${(vo.identifier)!}"  type="text" placeholder="请输入小组包名">
										<b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										     请输入小组包名</b> </label>
									</section>
								</div>

								<section class="col col-10" style="padding-left: 0px;">
									<label class="textarea"> <i class="icon-append fa fa-comment"></i> 										
										<textarea rows="5" name="groupDesc"  placeholder="请输入小组描述">${(vo.groupDesc)!}</textarea> 
										<b class="tooltip tooltip-right"><i class="fa fa-warning txt-color-teal"></i>
										     请输入小组描述</b>
									</label>
								</section>
							</fieldset>
						    <fieldset>
                                <div class="row">
                                    <section class="col col-5">
                                       <label class="input">请选择尺寸300x300 png icon</label>
									   <div class="input input-file">
										    <span class="button"><input id="file" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
										    </span><input type="text" placeholder="Include some files" readonly="">
									   </div>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-10">
                                           <#if (vo.groupPic)??>
                                           <ul class="operations" style="list-style-type: none;">
									         <li style="padding-left:2em;float:right;vertical-align: bottom;"><img src="${vo.groupPic}icon_l.png" /></li>
									         <li style="padding-left:2em;float:right;vertical-align: bottom;"><img src="${vo.groupPic}icon_xl.png" /></li>
									         <li style="padding-left:2em;float:right;vertical-align: bottom;"><img src="${vo.groupPic}icon_xxl.png" /></li>
									         <li style="padding-left:2em;float:right;vertical-align: bottom;"><img src="${vo.groupPic}icon_o.png" /></li>
									        </ul>
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
		
		$(document).ready(function() {
			var $editForm = $("#editForm").validate({
				// Rules for form validation
				rules : {
					site : {
						required : true
					},
					groupName : {
						required : true
					},
					identifier:{
						required :true
					},
					groupDesc : {
						required : true,
					    rangelength:[1,200]
					}
					
				},
				messages : {
					site : {
						required : 'Please select a site'
					},
					groupName : {
						required : 'Please select an groupName'
					},
					identifier:{
                        required:'Please enter the identifier'
					},
					groupDesc : {
						required : 'Please enter a groupDesc',
						rangelength:'字段超长，不能超过200字符'
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