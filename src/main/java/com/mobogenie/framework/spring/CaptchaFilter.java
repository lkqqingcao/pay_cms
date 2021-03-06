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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;
import org.springframework.web.util.WebUtils;

import com.google.common.base.Preconditions;
import com.mobogenie.framework.constant.CommonConstant;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月16日
 */
@Component
public class CaptchaFilter extends GenericFilterBean {
	
	private RequestMatcher loginRequestMatcher;
	
	
	private String filterProcessesUrl  = "j_spring_security_check.htm";
	
	
	private String redirectPageUrl ;

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
	        throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest) req;
	     HttpServletResponse response = (HttpServletResponse) res;
		 if (isLoginPage(request)&&isInValidCode(request,response)) {
		     response.sendRedirect(redirectPageUrl);
		     return;
		 }
		 chain.doFilter(request, response);

	}

	private boolean isLoginPage(HttpServletRequest request) {
	        return  loginRequestMatcher.matches(request);
    }

	private boolean isInValidCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Object serverCode = WebUtils.getSessionAttribute(request, CommonConstant.CAPTCHA_CODE);
		String code = request.getParameter("j_checkcode");
		return serverCode == null || code == null || !code.equalsIgnoreCase(serverCode.toString());
	}

	public String getFilterProcessesUrl() {
		return filterProcessesUrl;
	}

	@Value("#{application['security.login-processing-url']}")
	public void setFilterProcessesUrl(String filterProcessesUrl) {
		this.filterProcessesUrl = Preconditions.checkNotNull(filterProcessesUrl);
		this.loginRequestMatcher = new AntPathRequestMatcher(filterProcessesUrl);
	}

	
	public String getRedirectPageUrl() {
		return redirectPageUrl;
	}
    
	@Value("#{application['security.code-failure-url']}")
	public void setRedirectPageUrl(String redirectPageUrl) {
		this.redirectPageUrl = Preconditions.checkNotNull(redirectPageUrl);
	}
	
	

}
