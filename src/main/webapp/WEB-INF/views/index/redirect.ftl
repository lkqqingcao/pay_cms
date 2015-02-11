<!DOCTYPE html>
<html lang="en-us" id="extr-page">
<body></body>
<script src="${ctx}/static/js/jquery-2.1.1.js" ></script>
<script type="text/javascript">
$(function(){
   var url = "${ctx}/index/dashboard.htm";
  // if(window.localStorage){
  //    var lastUrl = localStorage.getItem("lastUrl");
  //    if(lastUrl){
  //       url = lastUrl;
  //    }
  // }
   window.location.href=url;
})
</script>
</html>
