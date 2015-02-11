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

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;

import com.google.common.base.Predicate;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Iterables;

/**
 * 
 * @author wanghongfeng
 * @date 2014年9月30日
 */
@Component
public class SpecialRequestMatcher implements RequestMatcher {
	public static final ImmutableList<String> list= ImmutableList.<String>builder()
			                                        .add("login.").add("checkLogin.").build();
	private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
    
	
	 
	@Override
    public boolean matches(final HttpServletRequest request) {
		 boolean matchMethod =  !allowedMethods.matcher(request.getMethod()).matches();
		 Iterable<String> filtered = Iterables.filter(list, new Predicate<String>() {
			    @Override
			    public boolean apply(String url) {
			        return getRequestPath(request).contains(url);
			    }
			});
		 return matchMethod &&filtered.iterator().hasNext();
    }
	
	 private String getRequestPath(HttpServletRequest request) {
	        String url = request.getServletPath();
	        if (request.getPathInfo() != null) {
	            url += request.getPathInfo();
	        }
	        return  url.toLowerCase();

	    }

}
