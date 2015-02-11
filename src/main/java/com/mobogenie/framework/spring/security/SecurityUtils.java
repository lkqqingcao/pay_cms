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

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.mobogenie.pay.auth.domain.SecurityUser;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月17日
 */
public final class SecurityUtils {
	private SecurityUtils(){};
	
	public static Authentication  getAuthentication() {
	   return	SecurityContextHolder.getContext().getAuthentication();
    }
	
	public static Object getPrincipal(){
		Authentication authentication  = getAuthentication();
		if (authentication!=null) {
	        return authentication.getPrincipal();
        }
		return	null;
	}
	
	public static String  getUsername(){
		Object principal = null;
		if ((principal=getPrincipal())==null) {
			return null;
		}
		if(principal instanceof String){
			return (String)principal;
		}
		return ((SecurityUser)principal).getUser().getUsername();
	}
	
	
	public static boolean hasRole(String role){
		SecurityUser securityUser = null;
		try {
			securityUser =(SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        } catch (Exception e) {
	        return false;
        }
		return securityUser.hasAuthority(role);
	}
	

}
