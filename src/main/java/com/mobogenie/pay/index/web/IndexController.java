/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.index.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Objects;
import com.google.gdata.util.common.base.CharMatcher;
import com.mobogenie.framework.spring.security.SecurityUtils;
import com.mobogenie.framework.util.Md5Utils;
import com.mobogenie.framework.util.RetMsg;
import com.mobogenie.pay.auth.domain.SecurityUser;
import com.mobogenie.pay.auth.domain.User;
import com.mobogenie.pay.auth.service.UserService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月16日
 */
@Controller
public class IndexController {
	@Autowired
	private UserService userService;
	
	private static final Logger LOGGER  = LoggerFactory.getLogger(IndexController.class);
	

	@RequestMapping("index.htm")
	public String loginSuccess(ModelMap modelMap){
		LOGGER.info(SecurityUtils.getPrincipal().toString());
		Object object = SecurityUtils.getPrincipal();
		SecurityUser securityUser = null;
		if (object instanceof SecurityUser) {
	        securityUser = (SecurityUser)object;
	        modelMap.put("user",securityUser.getUser());
        }
		return "/index/redirect";
	}
	
	@RequestMapping("index/dashboard")
	public String dashboard(ModelMap modelMap){
		return "/index/dashboard";
	}
	
	
	@RequestMapping("index/login")
	public String login(String code,ModelMap modelMap){
		modelMap.put("code", code);
		return "/index/login";
	}
	
	@ResponseBody
	@RequestMapping(value="index/changePwd",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg changePwd(String oldPwd,String newPwd,String rPwd){
		SecurityUser securityUser = (SecurityUser)SecurityUtils.getPrincipal();
	    User user = 	securityUser.getUser();
	    boolean check = Objects.equal(Md5Utils.encodeString(oldPwd, "pay"), user.getPassword());
	    if (!check) {
	        return RetMsg.newInstance(201, "error");
        }
		if (!Objects.equal(newPwd, rPwd)||newPwd.length()<6||!CharMatcher.ASCII.matchesAllOf(newPwd)||!CharMatcher.INVISIBLE.matchesNoneOf(newPwd)) {
			return RetMsg.newInstance(202, "error");
        }
		user.setPassword(Md5Utils.encodeString(newPwd, "pay"));
		boolean ret = userService.updateUser(user,user.getId());
		if (ret) {
		      return RetMsg.getDefault(); 
		}
		return RetMsg.newInstance(203, "error"); 
	}
	

}
