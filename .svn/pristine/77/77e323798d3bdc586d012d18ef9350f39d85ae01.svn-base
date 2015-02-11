/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.framework.spring.security;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.mobogenie.pay.auth.domain.SecurityUser;
import com.mobogenie.pay.auth.domain.User;
import com.mobogenie.pay.auth.domain.User.EnableEnum;
import com.mobogenie.pay.auth.service.UserService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月15日
 */
@Component
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserService userService;
	

	@Override
    public UserDetails loadUserByUsername(String username) {
		   if (StringUtils.isBlank(username)) {
	           throw new UsernameNotFoundException("username can't be null"); 
           }
		   User user =userService.findUserWithRoles(username);
		   if (user==null||user.getEnable()==EnableEnum.Disable.getValue()) {
			   throw new UsernameNotFoundException("user can't be null"); 
           }
		   return SecurityUser.newInstance(user);
    }

}
