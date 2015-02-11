/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.auth.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.framework.util.RetMsg;
import com.mobogenie.pay.auth.domain.Resource;
import com.mobogenie.pay.auth.service.ResourceService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月12日
 */
@Controller
@RequestMapping("auth/resource")
public class ResourceController {
	
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping(value="getRoleRs",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Resource> getRoleRs(Integer roleId,PaginationPlain pagination){
	    return	resourceService.getResourceRolePage(roleId, pagination);
	}
	
	
	@ResponseBody
	@RequestMapping(value="doAllocateRs",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg doAllocateRs(String roleId,String ids){
		String[] idArray = StringUtils.split(ids,",");
		List<Integer> list = Lists.newArrayList();
		for (int i = 0; i < idArray.length; i++) {
	         list.add(Integer.parseInt(idArray[i]));
        }
	   boolean ret = 	resourceService.updateResourceRole(Integer.parseInt(roleId), list);
	   if (ret) {
	      return RetMsg.getDefault();
       }
	   return RetMsg.newInstance(222, "ERROR");
	}
	
	
	@RequestMapping("toList")
	public String toList(ModelMap modelMap){
		return "auth/rslist";
	}
	
	
	@ResponseBody
	@RequestMapping(value="getList",produces=MediaType.APPLICATION_JSON_VALUE)
	public Page<Resource> getList(PaginationPlain pagination){
		 return resourceService.getResourcePage(null, pagination);
	}
	
	@ResponseBody
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg save(Resource resource,String type){
		 if (StringUtils.isNotBlank(type)&&type.equals("add")) {
		       return doAdd(resource);     
	       }
		   Integer resourceId = resource.getId();
		   boolean ret = resourceService.updateResource(resource,resourceId);
		   if (ret) {
		      return RetMsg.getDefault(); 
	       }else {
			  return RetMsg.newInstance(222, "error");
		   }
		}
		
		
	private RetMsg doAdd(Resource resource) {
		 boolean ret = resourceService.addResouce(resource);
		 if (ret) {
		     return RetMsg.getDefault(); 
	     }else {
			  return RetMsg.newInstance(222, "error");
		 }
    }
	
}
