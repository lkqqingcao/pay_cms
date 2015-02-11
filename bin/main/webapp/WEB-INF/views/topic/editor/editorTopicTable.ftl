<table id="_table" class="table table-striped table-bordered	 table-hover" width="100%">
									<thead>
										<tr>
											<th width="2%" class="center">
										          <input type="checkbox" id="checkboxHead" onclick="common.checkAll(this);" />
										    <th width="5%">ID</th>
										    <th width="10%">小组包名</th>
											<th width="10%">小组ID</th>
										    <th width="45%">帖子内容</th>
											<th width="4%">状态</th>
											<th width="13%">操作</th>
										</tr>
									</thead>
									<tbody>
									 <#list sp.list as item>
										<tr>
											<td class="center" ><input type="checkbox" name="selectIds" value="${item.id}"   /></td>
											<td>${item.id}</td>
										    <td style="word-break:break-all;">${(item.identifier)!}</td>
											<td>${(item.groupid)!}</td>	
											<td style="word-break:break-all;">
												<div class="inner innerFace replies"> 
											       <span class="author">
											       <span class="from-logon">${(item.uname)!}</span>：</span>  <span class="postTime">${(item.createTime)?datetime}发表</span>  
											       <div class="body">
											       <div class="postbody">${(item.topicContent)!}
											       <br>
											       <#if (item.topicLeavePic)??>
											         <a pop="p_img" href="${item.topicLeavePic}"><img src="${(item.topicLeavePic)!}" style="width:20px; height:18px;"/></a>
											       </#if>        
											      </div>
											      </div>  
											         <ul class="operations">  
											              <li >站点<em>[${(item.site)!}]</em></li>  
											              <li >评论数<em>[${(item.commentCount)!}]</em></li>  
												          <li >赞数<em>[${(item.praiseCount)!}]</em></a></li>  
											         </ul>        
											     </div>
                                            </td> 
																				
											<td><#if item.isHot??&&item.isHot==1><span class="label label-warning" style="font-size:13px">精选</span><#else><span class="label label-info" style="font-size:13px">普通</span></#if></td>
											<td>
												 <#if item.isHot??&&item.isHot==1>
												<a  href="javascript:void(0);" class="btn btn-primary btn-xs" rel="tooltip" data-placement="top" data-original-title="取消精选" onclick="commonAjax('${ctx}topic/editor/doSetHot.htm?id=${item.id}&toHot=false');"><i class="fa fa-lg fa-fw fa-heart"></i></a>
												<#else>
												<a href="javascript:void(0);" class="btn btn-primary btn-xs" rel="tooltip" data-placement="top" data-original-title="置为精选"onclick="commonAjax('${ctx}topic/editor/doSetHot.htm?id=${item.id}&toHot=true');"><i class="fa fa-lg fa-fw fa-heart"></i></a>
												</#if>
												<a href="javascript:void(0);" class="btn btn-success  btn-xs" rel="tooltip" data-placement="top" data-original-title="修改" onclick="common.popup('${ctx}topic/editor/toEdit.htm?id=${item.id}');"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i></a>
												<a href="javascript:void(0);" class="btn btn-danger btn-xs"  rel="tooltip" data-placement="top" data-original-title="删除" onclick="if(confirm('是否确认删除?'))commonAjax('${ctx}topic/editor/doDel.htm?id=${item.id}');"><i class="fa fa-lg fa-fw fa-trash-o"></i></a>
											</td>
										</tr>
									  </#list>
									</tbody>
</table>

<@common.spaging sp.samplePaging/>
