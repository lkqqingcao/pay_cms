/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.framework.spring;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.util.WebUtils;

import com.google.common.base.Preconditions;

/**
 * 种本地化语言cookie，方便spring判断本地化语言
 * @author wanghongfeng
 * @date 2014年7月16日
 */
@Component
public class CookieLocaleFilter extends GenericFilterBean {
	
	
	private RequestMatcher localeChangeRequestMatcher;
	
	@Autowired
	private CookieLocaleResolver localeResolver;
	
	private String localeChangeUrl;
	
	
	private String redirectUrl;

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
	        throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest) req;
	     HttpServletResponse response = (HttpServletResponse) res;
		 if (isCookieChangePage(request)) {
			 String locale =  WebUtils.findParameterValue(request, "request_locale");
			 if (StringUtils.isBlank(locale)||(!locale.equalsIgnoreCase("en_US")&&!locale.equalsIgnoreCase("zh_CN"))) {
	            locale = "zh_CN";
             }
			 localeResolver.addCookie(response, locale);
		     response.sendRedirect(redirectUrl);
		     return;
		 }
		 chain.doFilter(request, response);

	}

	private boolean isCookieChangePage(HttpServletRequest request) {
	     return  localeChangeRequestMatcher.matches(request);
    }

	public String getLocaleChangeUrl() {
		return localeChangeUrl;
	}

	@Value("#{application['security.locale_change_url']}")
	public void setLocaleChangeUrl(String localeChangeUrl) {
		this.localeChangeUrl = Preconditions.checkNotNull(localeChangeUrl);
		localeChangeRequestMatcher = new AntPathRequestMatcher(localeChangeUrl);
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	@Value("#{application['security.default-target-url']}")
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = Preconditions.checkNotNull(redirectUrl);
	}

}
