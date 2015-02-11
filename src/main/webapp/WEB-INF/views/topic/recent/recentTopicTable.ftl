<table id="_table" class="table table-striped table-bordered table-hover" width="100%">
									<thead>
										<tr>
											<th class="center" width="2%">
										          <input type="checkbox" id="checkboxHead" onclick="common.checkAll(this);" />
											<th width="10">ID</th>
											<th width="43%">帖子内容</th>
											<th width="10%">小组ID</th>
											<th width="5%">点赞数</th>
											<th width="5%">评论数</th>
											<th width="5%">创建时间</th>
											<th width="5%">更新时间</th>
											<th width="6%">话题图片</th>
											<th width="5%">状态</th>
											<th width="6%">操作</th>
										</tr>
									</thead>
									<tbody>
									 <#list sp.list as item>
										<tr>
											<td class="center" ><input type="checkbox" name="selectIds" value="${item.id}"   /></td>
											<td>${item.id}</td>
											<td style="word-break:break-all;">${(item.topicContent)!}</td>
											<td>${(item.groupid)!}</td>
											<td>${(item.praiseCount)!}</td>
											<td>${(item.commentCount)!}</td>
											<td>${(item.createTime)?datetime}</td>
											<td>${item.updateTime?datetime}</td>
											<td>
											  <#if (item.topicLeavePic)??>
											   <a pop="p_img" href="${(item.topicLeavePic)!}"><img src="${(item.topicLeavePic)!}" style="width:20px; height:18px;"/></a>
											  </#if>
											 </td>
											<td><#if item.isHot??&&item.isHot==1><span class="label label-warning" style="font-size:13px">精选</span><#else><span class="label label-info" style="font-size:13px">普通</span></#if></td>
											<td>
												<#if item.isHot??&&item.isHot==1>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" onclick="commonAjax('${ctx}topic/recent/doSetHot.htm?id=${item.id}&toHot=false');">取消精选</a>
												<#else>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" onclick="commonAjax('${ctx}topic/recent/doSetHot.htm?id=${item.id}&toHot=true');">置为精选</a>
												</#if>
											</td>
										</tr>
									  </#list>
									</tbody>
</table>

<@common.spaging sp.samplePaging/>
