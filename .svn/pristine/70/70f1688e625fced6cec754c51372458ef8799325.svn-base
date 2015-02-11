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

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gdata.util.common.base.CharMatcher;
import com.mobogenie.framework.constant.CommonConstant;
import com.mobogenie.framework.spring.security.SecurityUtils;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.framework.util.RetMsg;
import com.mobogenie.pay.auth.domain.User;
import com.mobogenie.pay.auth.service.UserService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月12日
 */
@Controller
@RequestMapping("auth/user")
public class UserController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class); 
	
	
	
	@Autowired
	private UserService userService;
	
	
	@ResponseBody
	@RequestMapping("reset")
    public RetMsg reset(Integer userid){
		LOGGER.info(userid + "is reset");
		User user = new User();
		user.setPassword(CommonConstant.INIT_PASSWORD);
		boolean ret = userService.updateUser(user,userid);
		return ret?RetMsg.getDefault():RetMsg.newInstance(222, "error");
	}
	
	@ResponseBody
	@RequestMapping(value="enable",produces=MediaType.APPLICATION_JSON_VALUE)
    public RetMsg enable(Integer userid,Integer enable){
		User user = new User();
		user.setEnable(enable);
		boolean ret = userService.updateUser(user,userid);
		return ret?RetMsg.getDefault():RetMsg.newInstance(222, "error");
	}

	@RequestMapping("toList")
	public String toList(User user){
		return "/auth/userlist";
	}
	
	
	@ResponseBody
	@RequestMapping(value ="doEdit",produces=MediaType.APPLICATION_JSON_VALUE)
	public RetMsg doEdit(User user,String type){
	   if (user.getUsername()==null||user.getUsername().length()<4||!CharMatcher.DIGIT.or(CharMatcher.JAVA_LOWER_CASE).or(CharMatcher.JAVA_UPPER_CASE).matchesAllOf(user.getUsername())) {
	      return RetMsg.newInstance(201, "error");
       }
	   if (StringUtils.isNotBlank(type)&&type.equals("add")) {
	       return doAdd(user);     
       }
	   Integer userId = user.getId();
	   boolean ret = userService.updateUser(user,userId);
	   if (ret) {
	      return RetMsg.getDefault(); 
       }else {
		  return RetMsg.newInstance(222, "error");
	   }
	}
	
	
	
	private RetMsg doAdd(User user) {
		user.setPassword(CommonConstant.INIT_PASSWORD);
		 boolean ret = userService.findUser(user.getUsername())==null&&userService.addUser(user);
		 if (ret) {
		     return RetMsg.getDefault(); 
	     }else {
			  return RetMsg.newInstance(222, "error");
		 }
    }

	@ResponseBody
	@RequestMapping(value="getList",produces=MediaType.APPLICATION_JSON_VALUE)
	public Page<User> getList(PaginationPlain pagination){
		return userService.getUserPage(null, pagination,!SecurityUtils.hasRole(CommonConstant.ROLE_ADMIN));
	}
	
	

}
