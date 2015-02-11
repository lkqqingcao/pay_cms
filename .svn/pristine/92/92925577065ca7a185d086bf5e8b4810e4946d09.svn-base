<table id="_table" class="table table-striped table-bordered table-hover" width="100%" onclick="showindex()" id="mytable">
	<thead>
		<tr>
			<th class="center" withd="2%">
		          <input type="checkbox" id="checkboxHead" onclick="common.checkAll(this);" />
		    </th>
			<th widht="5%">ID</th>
			<th width="45%">帖子内容</th>
			<th width="5%">评论数</th>
			<th width="5%">点赞数</th>
			<th width="5%">操作人</th>
			<#-- th>是否固定</th -->
			<th width="5%">缩略图</th>
			<th width="15%">排序</th>
			<th width="15%">操作</th>
		</tr>
	</thead>
	<tbody>
	 <#list sp.list as item>
		<tr>
			<td class="center" ><input type="checkbox" name="selectIds" orderNum="${item.orderNum!}" value="${item.id!}" /></td>
			<td>${item.id}</td>
			<td style="word-break:break-all;">${item.topicContent!}</td>
			<td>${item.commentCount!}</td>
			<td>${item.praiseCount!}</td>
			<td>${item.operator!}</td>
			<#-- td>${item.isFixed!}</td -->
			<td>
			    <#if (item.topicLeavePic)??>
			    <a pop="p_img" href="${item.topicLeavePic!}"><img src="${item.topicLeavePic!}" style="width:20px; height:18px;"/></a>
			    </#if>
			</td>
			<td>
				<input name="orderNum" value="${item.orderNum!}" style="width:80px;" maxlength=3 val="${item.orderNum!}" type="text" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" >
			<td>
				<a href="javascript:void(0);" class="btn btn-danger btn-xs" onclick="if(confirm('确认执行操作吗？'))commonAjax('${ctx}topic/selected/doDelete.htm?id=${item.id}');">删除</a>
			</td>
		</tr>
	  </#list>
	</tbody>
</table>
<#-- @common.spaging sp.samplePaging/ -->
<script type="text/javascript">
	$(document).ready(function() {
    	$(":text[name='orderNum']").blur(function(){ 
    		if($(this).val() != $(this).attr("val")) {
    			$(this).parents("tr:last").find("input:first").attr("checked","checked"); //.attr("orderNum",$(this).val());
    		}
    	});
	});
</script>