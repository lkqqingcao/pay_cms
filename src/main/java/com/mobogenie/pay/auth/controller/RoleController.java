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
import com.mobogenie.framework.constant.CommonConstant;
import com.mobogenie.framework.spring.security.SecurityUtils;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.framework.util.RetMsg;
import com.mobogenie.pay.auth.domain.Role;
import com.mobogenie.pay.auth.service.RoleService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月12日
 */
@Controller
@RequestMapping("auth/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("toList")
	public String toRoleList(ModelMap modelMap){
		return "/auth/rolelist";
	}
	
	@ResponseBody
	@RequestMapping(value="getList",produces=MediaType.APPLICATION_JSON_VALUE)
	public Page<Role> getList(PaginationPlain pagination){
		if (SecurityUtils.hasRole(CommonConstant.ROLE_ADMIN)) {
			return roleService.getRolePage(null, pagination,true);
        }else {
			return roleService.getRolePage(null, pagination, false);
		}
	}
	
	@RequestMapping("toUserRole")
	public String toUserRole(Integer userid,ModelMap modelMap){
		modelMap.put("userid",userid);
		return "/auth/userrolelist";
	}
	
	@ResponseBody
	@RequestMapping(value="getRole",produces=MediaType.APPLICATION_JSON_VALUE)
	public Page<Role> getRole(Integer userid,PaginationPlain pagination){
		if (SecurityUtils.hasRole(CommonConstant.ROLE_ADMIN)) {
			return	roleService.getUserRolePage(userid, pagination,true);
		}else {
			return	roleService.getUserRolePage(userid, pagination,false);
		}
	}

	@ResponseBody
	@RequestMapping(value="doAdd",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg doAdd(Role role){
	    boolean ret = roleService.addRole(role);
	    if (ret) {
		      return RetMsg.getDefault();
	       }
		return RetMsg.newInstance(222, "ERROR");
	}
	
	@ResponseBody
	@RequestMapping(value="doEdit",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg doEdit(Role role){
	    boolean ret = roleService.updateRole(role, role.getId());
	    if (ret) {
		      return RetMsg.getDefault();
	       }
		return RetMsg.newInstance(222, "ERROR");
	}
	
	@RequestMapping("toEdit")
	public String getRoleList(String id,ModelMap modelMap){
		modelMap.put("roleId",id);
		return "/auth/rolerslist";
	}
	
	

	@ResponseBody
	@RequestMapping(value="doAllocateRole",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg doAllocateRole(Integer userid,String ids){
		String[] idArray = StringUtils.split(ids,",");
		List<Integer> list = Lists.newArrayList();
		for (int i = 0; i < idArray.length; i++) {
	         list.add(Integer.parseInt(idArray[i]));
        }
	   boolean ret = 	roleService.addRoleUser(userid,list);
	   if (ret) {
	      return RetMsg.getDefault();
       }
	   return RetMsg.newInstance(222, "ERROR");
	}
	
}
