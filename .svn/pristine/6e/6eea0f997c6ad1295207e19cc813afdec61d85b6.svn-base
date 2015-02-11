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

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.google.common.base.Preconditions;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Lists;
import com.google.common.collect.Multimap;
import com.google.common.collect.Sets;
import com.mobogenie.pay.auth.domain.Resource;
import com.mobogenie.pay.auth.domain.Role;
import com.mobogenie.pay.auth.service.ResourceService;
import com.mobogenie.pay.auth.service.RoleService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月15日
 */
@Component
public class CustomeMetadataSource implements FilterInvocationSecurityMetadataSource,
        InitializingBean {

	@Autowired
	private RoleService roleService;

	@Autowired
	private ResourceService resourceService;

	@Value("#{roleVoter.rolePrefix}")
	private String rolePrefix;
	
	private ConfigAttribute superAdminSecurityConfig;
	// 
	/**
	 * role-pattern_set
	 */
	private volatile Multimap<RequestMatcher, ConfigAttribute> requestMap = HashMultimap.create();

	/**
	 * 返回请求url所有匹配的pattern对应的role
	 * 比如请求链接是/auth/user/getUser.json,
	 * /auth/**对应的role是ROLE_AUTH
	 * /auth/user/**对应的是ROLE_AUTH_USER
	 * 则返回ROLE_AUTH,ROLE_AUTH_USER
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		final HttpServletRequest request = ((FilterInvocation) object).getRequest();
		Set<ConfigAttribute> retSet = Sets.newHashSet();
		boolean hasCustomRole = false;
        for (Map.Entry<RequestMatcher,ConfigAttribute> entry: requestMap.entries()) {
        	if (entry.getKey().matches(request)) {
        		ConfigAttribute configAttribute = entry.getValue();
        		hasCustomRole|=retSet.add(configAttribute)&&configAttribute.getAttribute().startsWith(rolePrefix);
            }
        }
        //对于所有要求有ROLE_类型角色的url,自动增加ROLE_ADMIN角色，让超级管理员随意访问
        if (hasCustomRole) {
	        retSet.add(superAdminSecurityConfig);
	        return retSet;
        }
        return retSet;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}

	/**
	 * load all <resource.pattern--->role.name> map to cachemap when start
	 * spring context
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		superAdminSecurityConfig = new SecurityConfig(Preconditions.checkNotNull(rolePrefix)+"_ADMIN");
		refreshCache();
	}

	/**
	 * load all <resource.pattern--->role.name> map to cachemap when start
	 * spring context
	 */
	@Scheduled(fixedDelay = 150000)
	public void refreshCache() {
		List<Role> list = roleService.findAllRoleList();
		List<Role> newList = Lists.newArrayList();
		for (Role role : list) {
			newList.add(roleService.findRoleWithRs(role.getId()));
		}
		Multimap<RequestMatcher, ConfigAttribute> interceptorMap = HashMultimap.create();
		for (Role role : newList) {
			List<Resource> tmpList = role.getRslist();
			for (Resource resource : tmpList) {
				interceptorMap.put(new AntPathRequestMatcher(resource.getPattern()),
				        new SecurityConfig(role.getName()));
			}
		}
		requestMap = interceptorMap;
	}

}
