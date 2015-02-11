<table id="_table" class="table table-striped table-bordered table-hover" width="100%">
									<thead>
										<tr>
											<th width="2%" class="center">
										          <input type="checkbox" id="checkboxHead" onclick="common.checkAll(this);" />
											<th width="10%">ID</th>
											<th width="10%">小组名称</th>
											<th width="7%">头像</th>
											<th width="15%">包名</th>
											<th width="7%">创建时间</th>
											<th width="7%">修改时间</th>
											<th width="7%">用户数</th>
											<th width="7%">话题数量</th>
											<th width="7%">状态</th>
											<th width="7%">操作</th>
										</tr>
									</thead>
									<tbody>
									 <#list sp.list as item>
									   <#if (item.id)??>
										<tr>
											<td class="center" ><input type="checkbox" name="selectIds" value="${item.id}"   /></td>
											<td style="word-break:break-all;">${item.id}</td>
											<td style="word-break:break-all;">${(item.groupName)!}</td>
											<td><#if (item.groupPic)??><a pop="p_img" href="${item.groupPic}icon_o.png"><img src="${item.groupPic}icon_l.png" style="width:20px; height:18px;"/></#if></a></td>
											<td style="word-break:break-all;">${(item.identifier)!}</td>
											<td>${(item.createTime)?datetime}</td>
											<td>${(item.updateTime)?datetime}</td>
											<td>${(item.usercount)!}</td>
											<td>${(item.topiccount)!}</td>
										    <td><#if item.isHot??&&item.isHot==1><span class="label label-warning" style="font-size:13px">精选</span><#else><span class="label label-info" style="font-size:13px">普通</span></#if></td>
											<td >
											    <#if item.isHot??&&item.isHot==1>
												<a  href="javascript:void(0);" class="btn btn-primary btn-xs" rel="tooltip" data-placement="top" data-original-title="取消精选" onclick="commonAjax('${ctx}group/doSetHot.htm?id=${item.id}&toHot=false');"><i class="fa fa-lg fa-fw fa-heart"></i></a>
												<#else>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" rel="tooltip" data-placement="top" data-original-title="置为精选"onclick="commonAjax('${ctx}group/doSetHot.htm?id=${item.id}&toHot=true');"><i class="fa fa-lg fa-fw fa-heart"></i></a>
												</#if>
												<a href="javascript:void(0);" class="btn btn-danger btn-xs" rel="tooltip" data-placement="top" data-original-title="修改" onclick="common.popup('${ctx}group/toEdit.htm?id=${item.id}');"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i></a>
											</td>
										</tr>
										</#if>
									  </#list>
									</tbody>
</table>

<@common.spaging sp.samplePaging/>
