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

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.gdata.util.common.base.Objects;

/**
 * spring security 用户
 * @author wanghongfeng
 * @date 2014年7月15日
 */
public class SecurityUser implements UserDetails {
	
    private static final long serialVersionUID = -6103460020531392286L;
	private User user;
	
	public static SecurityUser newInstance(User user){
		return  new SecurityUser(user);
	}
	
	public SecurityUser(User user){
		this.user = user;
	}
	
	public User getUser(){
		return user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		if (user.getRoleList()==null) {
	        return null;
        }
		List<GrantedAuthority> retList = Lists.newArrayList();
		List<Role> list  = user.getRoleList();
		for (Role role : list) {
	         retList.add(SecurityRole.newInstace(role));
        }
		return retList;
	}

	@SuppressWarnings("rawtypes")
    public boolean hasAuthority(String roleName){
		Preconditions.checkNotNull(roleName);
		Collection collection = getAuthorities();
		for (Object object : collection) {
			GrantedAuthority authority = (GrantedAuthority)object;
			if (Objects.equal(authority.getAuthority(), roleName)) {
	            return true;
            }
        }
		return false;
	}
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		 return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
    public String toString() {
	    return "SecurityUser [user=" + user + "]";
    }

}
