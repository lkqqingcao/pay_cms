/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.auth.domain;

import org.springframework.security.core.GrantedAuthority;

/**
 * spring security 角色
 * @author wanghongfeng
 * @date 2014年7月15日
 */
public class SecurityRole implements GrantedAuthority {
	
    private static final long serialVersionUID = 8367559026968414851L;
	private Role role;
	
	public static SecurityRole newInstace(Role role){
		return new SecurityRole(role);
	}
	
	public SecurityRole(Role role){
		this.role = role;
	}

	@Override
	public String getAuthority() {
		return role.getName();
	}

}
