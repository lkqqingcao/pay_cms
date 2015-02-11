///////////////sunyf add start


function setupTip(){
   // 缩略图预览功能
	$("a[pop='p_img']").mouseover(function(){
		var $div="<div class='p_img'><img src='"+this.href+"' /></div>";
		$("body").append($div);
	}).mouseout(function(){
		$(".p_img").remove();
	}).mousemove(function(e){
		var img = new Image();
		img.src = this.href;
		$(".p_img").css({"left":(e.pageX-img.width-40)+"px","top":(e.pageY-img.height/2)+"px"});
	});
	// 文本提示框功能，可强制换行
	$("span[pop='p_tip']").mouseover(function(){
		var $dt="<div class='p_tip'>"+$(this).attr("tip")+"</div>";
		$("body").append($dt);
	}).mouseout(function(){
		$(".p_tip").remove();
	}).mousemove(function(e){
		$(".p_tip").css({"left":(e.pageX+10)+"px","top":(e.pageY+5)+"px"});
	});
}

$(function(){
	setupTip();

});

jQuery.validator.addMethod("regex"
	, function(value, element, params) {
	    var exp = new RegExp(params);
	    return exp.test(value);
	}
	, "<@sns.message 'msg_com_illegal'/>"
);

///////////////sunyf add end