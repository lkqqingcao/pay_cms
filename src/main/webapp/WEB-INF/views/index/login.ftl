<!DOCTYPE html>
<html lang="en-us" id="extr-page">
<head>
<@common.header/>
<@common.css/>
</head>
<body class="">
		<header id="header" style="height: 90px;">
			<div id="logo-group">
				<span id="logo" style="margin-top: 13px;"> <img src="${ctx}static/img/logo-mb.png" alt="Pay Cms" style="width: 192px; height: 52px;"> </span>
			</div>
		</header>
		<div id="main" role="main">
			<!-- MAIN CONTENT -->
			<div id="content" class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">Pay CMS For Mobogenie</h1>
						<div class="hero">
							<div class="pull-left login-desc-box-l">
								<h4 class="paragraph-header">If you have any questions, please contact with mobogenie cms pay</h4>
							</div>
							<img src="${ctx}/static/img/demo/7.png" class="pull-right display-image" alt="" style="width:210px">
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
						<div class="well no-padding">
							<form action="${ctx}j_spring_security_check.htm" id="login-form" class="smart-form client-form" method="post">
								<header>
									登录
								</header>
								<fieldset>
								   <#if code?exists>
								   <section>								         
							         <div class="alert alert-danger fade in">
								        <button class="close" data-dismiss="alert">×</button>
								           <i class="fa-fw fa fa-times"></i>
								           <strong>Error!</strong>   <@spring.message "${code}"/>
							          </div>
								    </seciont>
					                </#if>
									<section>
										<label class="label">Username</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" name="j_username" >
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter your username</b></label>
									</section>
									<section>
										<label class="label">Password</label>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
											<input type="password" name="j_password" >
											<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Enter your password</b> </label>
									</section>
									<input name="${_csrf.parameterName}" value="${_csrf.token}" hidden=true />
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">
										登录
									</button>
								</footer>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

        <footer class="page-footer" style="background:#f4f4f4;height:70px">
             <div class="row">
		       <div class="col-xs-12 col-sm-6">
			       <span style="color:#888">Mobogenie Cms &copy; 2013-2020</span>
		       </div>
	        </div>
		</footer>
<@common.js/>
<script type="text/javascript">
  	       	       var $ac =   $("#login-form").validate({
					// Rules for form validation
					rules : {
						j_username : {
							required : true							
						},
						j_password : {
							required : true,
							minlength : 3							
						},
						j_checkcode:{
							required:true
						}
					},

					// Messages for form validation
					messages : {
						j_username : {
							required : 'Please enter your username'
							
						},
						j_password : {
							required : 'Please enter your password'
						},
						j_jcheckcode:{
							required:'Please enter checkcode'
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});

			function changeValidateCode(obj){
  		          var timeNow = new Date().getTime();
  		          obj.src="http://cms.pay.voga360.com/index/getCode.htm?time="+timeNow;
  	       }
</script>
</body>
</html>