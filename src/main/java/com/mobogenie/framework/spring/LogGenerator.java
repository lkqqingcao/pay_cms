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

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.MDC;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.mobogenie.framework.util.IpAddressUtil;

/**
 * 
 * @author wanghongfeng
 * @date 2014年8月9日
 */
public final class LogGenerator {
	private LogGenerator(){};
	
	public static Map<String, String> next(HttpServletRequest request){
		Map<String, String> map = Maps.newLinkedHashMap();
		map.put("uri", request.getRequestURI());
		map.put("timestamp", System.currentTimeMillis()+"");
		StringBuilder sb = new StringBuilder();
		Map<String, String> paramMap = request.getParameterMap();
		Set<String> keys = paramMap.keySet();
		for(String paramName : keys) {
			String paramValue = request.getParameter(paramName).trim();
			if (!Strings.isNullOrEmpty(paramValue)) {
				sb.append(paramName+ ":" +paramValue + ",");
            }
		}
		String valueString = sb.toString();
		valueString = valueString.replaceAll(",$", "");
		map.put("params","["+valueString+"]");
		map.put("clientId", IpAddressUtil.getIpAddr(request));
		HttpSession session = request.getSession(false);
		if (session != null) {
			map.put("session", session.getId());
		}
		return map;
	}
	
	public static boolean putLog(String key,String msg){
		Object tmp =null;
		if ((tmp=MDC.get(UserLogFilter.CUSTOM_DATA))==null||!(tmp instanceof Map)) {
	        return false ;
        }
	    Map<String, String> map = (Map<String,String>)tmp;
	    map.put(key, msg);
	    return true;
	}
	
   public static boolean putAppId(Integer appId){
	    MDC.put(UserLogFilter.APP_ID, appId+"");
	    return true;
   }
}
