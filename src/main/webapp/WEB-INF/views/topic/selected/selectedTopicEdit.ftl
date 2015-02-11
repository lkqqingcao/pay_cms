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
	<!-- `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `AUDIT_STATUS` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态,0:未审核，1已审核',
  `IS_DELETED` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除,0:未删除1:已删除',
  `IMG_PATH` varchar(255) NOT NULL DEFAULT '' COMMENT '预览图路径',
  `DETAIL` varchar(1024) NOT NULL DEFAULT '' COMMENT '详细信息',
  `APK_ID` varchar(200) NOT NULL DEFAULT '' COMMENT '包名',
  `M_TYPE` int(11) NOT NULL DEFAULT '1' COMMENT '游戏类型，1射击，2动作，3战略',
  `CREATE_TIME -->
<section>
   <form id="editForm" enctype="multipart/form-data" class="smart-form" novalidate="novalidate" method="post" action="${ctx}game/doEdit.htm">
   	                        <input type="text" hidden="true" name="id" value="${(vo.id)!}" >
   	                        <input type="text" hidden="true" name="isDeleted" value="0" >
			                <fieldset>
				              <div class="row">
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" name="apkId" placeholder="APK_ID" value="${(vo.apkId)!}"   >
										</label>
									</section>
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-briefcase"></i>
											<input type="text" name="company" placeholder="Company">
										</label>
									</section>
								</div>

								<div class="row">
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-envelope-o"></i>
											<input type="email" name="email" placeholder="E-mail">
										</label>
									</section>
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-phone"></i>
											<input type="tel" name="phone" placeholder="Phone" data-mask="(999) 999-9999">
										</label>
									</section>
								</div>
							</fieldset>
						

							<fieldset>
								<div class="row">
									<section class="col col-6">
										<label class="select">
											<select multiple style="width:100%" class="select2">
														<optgroup label="Alaskan/Hawaiian Time Zone">
															<option value="AK">Alaska</option>
															<option value="HI">Hawaii</option>
														</optgroup>
														<optgroup label="Pacific Time Zone">
															<option value="CA">California</option>
															<option value="NV" selected="selected">Nevada</option>
															<option value="OR">Oregon</option>
															<option value="WA">Washington</option>
														</optgroup>
														<optgroup label="Mountain Time Zone">
															<option value="AZ">Arizona</option>
															<option value="CO">Colorado</option>
															<option value="ID">Idaho</option>
															<option value="MT" selected="selected">Montana</option><option value="NE">Nebraska</option>
															<option value="NM">New Mexico</option>
															<option value="ND">North Dakota</option>
															<option value="UT">Utah</option>
															<option value="WY">Wyoming</option>
														</optgroup>
														<optgroup label="Central Time Zone">
															<option value="AL">Alabama</option>
															<option value="AR">Arkansas</option>
															<option value="IL">Illinois</option>
															<option value="IA">Iowa</option>
															<option value="KS">Kansas</option>
															<option value="KY">Kentucky</option>
															<option value="LA">Louisiana</option>
															<option value="MN">Minnesota</option>
															<option value="MS">Mississippi</option>
															<option value="MO">Missouri</option>
															<option value="OK">Oklahoma</option>
															<option value="SD">South Dakota</option>
															<option value="TX">Texas</option>
															<option value="TN">Tennessee</option>
															<option value="WI">Wisconsin</option>
														</optgroup>
														<optgroup label="Eastern Time Zone">
															<option value="CT">Connecticut</option>
															<option value="DE">Delaware</option>
															<option value="FL">Florida</option>
															<option value="GA">Georgia</option>
															<option value="IN">Indiana</option>
															<option value="ME">Maine</option>
															<option value="MD">Maryland</option>
															<option value="MA">Massachusetts</option>
															<option value="MI" selected="selected">Michigan</option>
															<option value="NH">New Hampshire</option>
															<option value="NJ">New Jersey</option>
															<option value="NY">New York</option>
															<option value="NC">North Carolina</option>
															<option value="OH">Ohio</option>
															<option value="PA">Pennsylvania</option>
															<option value="RI">Rhode Island</option>
															<option value="SC">South Carolina</option>
															<option value="VT">Vermont</option>
															<option value="VA">Virginia</option>
															<option value="WV">West Virginia</option>
														</optgroup>
													</select>
												</label>
									</section>
									<section class="col col-6">
										<label class="select">
											<select name="mType">
												<option value="-1" selected="" disabled="">游戏类型</option>
												<option value="1" <#if (vo.mType)??&&(vo.mType)==1>selected</#if> >射击</option>
												<option value="2" <#if (vo.mType)??&&(vo.mType)==2>selected</#if> >动作</option>
												<option value="3" <#if (vo.mType)??&&(vo.mType)==3>selected</#if> >战略</option>
											</select> <i></i> </label>
									</section>
								</div>

								<div class="row">
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-calendar"></i>
											<input type="text" class="datetimepicker" name="startdate" data-date-format="YYYY-MM-DD HH:mm:ss" id="startdate" placeholder="Expected start date">
										</label>
									</section>
									<section class="col col-6">
										<label class="input"> <i class="icon-append fa fa-calendar"></i>
											<input type="text" class="datetimepicker"  name="finishdate" data-date-format="YYYY-MM-DD HH:mm:ss" id="finishdate" placeholder="Expected finish date">
										</label>
									</section>
								</div>

								<section>
									<div class="input input-file">
										<span class="button"><input id="file" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse</span><input type="text" value="${(vo.imgPath)!}" name="imgPath" placeholder="Include some files" readonly="" style="padding-bottom: 4px;">
									</div>
								</section>

								<section>
									<label class="textarea"> <i class="icon-append fa fa-comment"></i> 										
										<textarea rows="5" name="detail"  placeholder="请输入详细信息">${(vo.detail)!}</textarea> 
									</label>
								</section>
							</fieldset>
						    <fieldset>
                                <div class="row">
                                    <section class="col col-5">
									   <div class="input input-file">
										    <span class="button"><input id="file2" type="file" name="file2" onchange="this.parentNode.nextSibling.value = this.value">Browse
										    </span><input type="text" placeholder="Include some files" readonly="">
									   </div>
                                    </section>
                                    <section class="col">
									   <a style="padding: 6px 12px;" class="btn btn-primary" href="javascript:void(0);">上传</a>
                                    </section>
                                     <section class="col col-6">
									    <img src="img/superbox/superbox-full-1.jpg" width="100" height="100"/>
                                    </section>
                                </div>
							</fieldset>

                            <fieldset>
								<section>
									<div class="inline-group">
										<label class="radio">
											<input type="radio" value="1" <#if (vo.auditStatus)??&&(vo.auditStatus)==1>checked="true"</#if> name="auditStatus">
											<i></i>审核</label>
										<label class="radio">
											<input type="radio" value="0" <#if (vo.auditStatus)??&&(vo.auditStatus)==0>checked="true"</#if> name="auditStatus">
											<i></i>退回</label>
									</div>
								</section>

								<section>
									<label class="input">
										<input type="text" placeholder="Name on card" name="name">
									</label>
								</section>

								<div class="row">
									<section class="col col-10">
										<label class="input">
											<input type="text" data-mask="9999-9999-9999-9999" placeholder="Card number" name="card">
										</label>
									</section>
									<section class="col col-2">
										<label class="input">
											<input type="text" data-mask="[1-9].*" placeholder="CVV2" name="cvv">
										</label>
									</section>
								</div>

								<div class="row">
									<label class="label col col-4">Expiration date</label>
									<section class="col col-5">
										<label class="select">
											<select name="month">
												<option disabled="" selected="" value="0">Month</option>
												<option value="1">January</option>
												<option value="1">February</option>
												<option value="3">March</option>
												<option value="4">April</option>
												<option value="5">May</option>
												<option value="6">June</option>
												<option value="7">July</option>
												<option value="8">August</option>
												<option value="9">September</option>
												<option value="10">October</option>
												<option value="11">November</option>
												<option value="12">December</option>
											</select> <i></i> </label>
									</section>
									<section class="col col-3">
										<label class="input">
											<input type="text" data-mask="2099" placeholder="Year" name="year">
										</label>
									</section>
								</div>
								 <section>
									<label class="checkbox">
										<input type="checkbox" id="subscription" name="subscription">
										<i></i>I want to receive news and special offers</label>
									<label class="checkbox">
										<input type="checkbox" id="terms" name="terms">
										<i></i>I agree with the Terms and Conditions</label>
								</section>
								<section class="col col-5">
										<label class="label">Checkbox Toggles</label>
										 			<label class="toggle">
															<input type="checkbox" checked="checked" name="checkbox-toggle">
															<i data-swchoff-text="OFF" data-swchon-text="ON"></i>是否显示</label>
														<label class="toggle">
															<input type="checkbox" name="checkbox-toggle">
															<i data-swchoff-text="OFF" data-swchon-text="ON"></i>是否xx</label>
														<label class="toggle">
															<input type="checkbox" name="checkbox-toggle">
															<i data-swchoff-text="OFF" data-swchon-text="ON"></i>是否xx</label>
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