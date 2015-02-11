<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
									<thead>
										<tr>
											<th class="center">
										          <input type="checkbox" id="checkboxHead" onclick="common.checkAll(this);" />
											<th >ID</th>
											<th >审核状态</th>
											<th >包名</th>
											<th >游戏类型</th>
											<th >更新时间</th>
											<th >缩略图</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
									 <#list ps.list as item>
										<tr>
											<td class="center"><input type="checkbox" name="selectIds"   /></td>
											<td>${item.id}</td>
											<td><#if item.auditStatus==0>未审核<#else>已审核</#if></td>
											<td>${item.apkId}</td>
											<td><#if item.mType==1>射击<#elseif item.mType==2>动作<#else>益智 </#if></td>
											<td>${(item.updateTime)?datetime}</td>
											<td><a pop="p_img" href="${uploadPath}${item.imgPath?if_exists}"><img src="${uploadPath}${item.imgPath?if_exists}" style="width:20px; height:18px;"/></a></td>
											<td>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" onclick="common.popup('${ctx}game/toEdit.htm?id=${item.id}');">修改</a>
												<a href="javascript:void(0);" class="btn btn-danger btn-xs"  onclick="if(confirm('是否确认删除?'))commonAjax('${ctx}game/doDel.htm?id=${item.id}');"">删除</a>
											</td>
										</tr>
									  </#list>
									</tbody>
</table>
<@common.paging ps.pagination />
