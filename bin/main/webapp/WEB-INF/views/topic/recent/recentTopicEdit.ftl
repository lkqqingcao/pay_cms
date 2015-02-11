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
<body class="">
<section>
   <form id="editForm" enctype="multipart/form-data" class="smart-form" novalidate="novalidate" method="post" action="${ctx}game/doEdit.htm">
   	                        <input type="text" hidden="true" name="id" value="${(vo.id)!}" >
   	                        <#-->input type="text" hidden="true" name="isDeleted" value="0" -->
			               <fieldset>
								<div class="row">
									<section class="col col-6">
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
											</select> <i></i> </label>
									</section>
									<section>
										<label class="input">
											<input type="text" placeholder="uname" name="uname" value="${(vo.uname)!}">
										</label>
									</section>
									
								</div>
								<section>
									<label class="textarea"> <i class="icon-append fa fa-comment"></i> 										
										<textarea rows="5" name="detail"  placeholder="请输入话题内容">${(vo.topicContent)!}</textarea> 
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
                                    <section class="col">
									   <a style="padding: 6px 12px;" class="btn btn-primary" href="javascript:void(0);">上传</a>
                                    </section>
                                     <section class="col col-6">
									    <img src="${vo.topicPic}" width="100" height="100"/>
                                    </section>
                                </div>
							</fieldset>

                            <fieldset>
								<section>
									<div class="inline-group">
										<label class="radio">
											<input type="radio" name="status" value="1" <#if (vo.status)??&&(vo.status)==1>checked="true"</#if> >
											<i></i>审核</label>
										<label class="radio">
											<input type="radio" name="status" value="0" <#if (vo.status)??&&(vo.status)==0>checked="true"</#if> >
											<i></i>退回</label>
									</div>
								</section>

								<section>
									<label class="input">
										<input type="text" placeholder="Praise Count" name="praiseCount" value="${(vo.praiseCount)!}">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="text" placeholder="Comment Count" name="commentCount" value="${(vo.commentCount)!}">
									</label>
								</section>
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
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		function closeModal(){
			window.parent.closeModal();
			return false;
		}
		
		$(document).ready(function() {
			var $orderForm = $("#editForm").validate({
				// Rules for form validation
				rules : {
					name : {
						required : true
					},
					email : {
						required : true,
						email : true
					},
					phone : {
						required : true
					},
					interested : {
						required : true
					},
					budget : {
						required : true
					}
				},
	
				// Messages for form validation
				messages : {
					name : {
						required : 'Please enter your name'
					},
					email : {
						required : 'Please enter your email address',
						email : 'Please enter a VALID email address'
					},
					phone : {
						required : 'Please enter your phone number'
					},
					interested : {
						required : 'Please select interested service'
					},
					budget : {
						required : 'Please select your budget'
					}
				},
	
				// Do not change code below
				errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				}
			});
			if(!msg){
			}
			else if(msg=="success"){
			  successMsg("success","操作成功");
			}else if(msg=="error"){
			  errorMsg("error","操作失败");
			}
		 
			
		})
		</script>
	</body>
</html>