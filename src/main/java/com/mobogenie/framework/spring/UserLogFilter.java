

package com.mobogenie.framework.spring;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.AbstractRequestLoggingFilter;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.mobogenie.framework.beans.UserLog;
import com.mobogenie.framework.spring.security.SecurityUtils;
import com.mobogenie.pay.auth.domain.SecurityUser;
import com.mobogenie.pay.auth.service.UserLogService;

/**
 * @author wanghongfeng
 * @date 2014年8月9日
 */
@Component
public class UserLogFilter extends AbstractRequestLoggingFilter {
	
	@Autowired
	private UserLogService userLogService;

	protected final Logger logger = LoggerFactory.getLogger(UserLogFilter.class);

	public final static String USER_OPS_LOG = "mdc_ops_Log"; 
	
	public final static String CUSTOM_DATA =  "mdc_custom_data"; 
	
	public final static String APP_ID =  "mdc_app_id"; 
	
	private final static String excludePath = "/auth/userlog/doList.json";
	
	public final static Integer LIMIT = 1024;
	
	public final static Integer  BEFORE_REQUEST = 0;
	public final static Integer  AFTER_REQUEST = 1;
	

	/**
	 * MDC push + insert db userlog
	 */
	@Override
	protected void beforeRequest(HttpServletRequest request, String message) {
		try {
			String uri = request.getRequestURI();
			if (uri==null||!StringUtils.endsWithAny(uri, new String[]{".json",".htm"})||StringUtils.contains(uri, excludePath)) {
	            return;
            }
			UserLog userLog = getStartUserLog(request);
			MDC.put(USER_OPS_LOG, JSON.toJSONString(userLog));
			logger.info(userLog.toString());
			userLogService.addUserLog(userLog);
        } catch (Exception e) {
        	logger.error("error when get user op log",e);
        }
	}



	/**
	 * log selected response body  
	 */
	@Override
	protected void afterRequest(HttpServletRequest request, String message) {
		try {
			Object userlog    =  MDC.get(USER_OPS_LOG);
			Object customData =  MDC.get(CUSTOM_DATA);
			if (userlog!=null&&customData!=null&&customData instanceof Map &&!((Map)customData).isEmpty()) {
				UserLog newLog = getEndUserLog(userlog, customData);
				logger.info(newLog.toString());
				if (MDC.get(APP_ID)!=null) {
	                newLog.setAppId(Integer.parseInt(MDC.get(APP_ID)));
                }
			    userLogService.addUserLog(newLog);
            }
        } catch (Exception e) {
        	logger.error("error when remove user op log",e);
        }finally{
        	MDC.remove(USER_OPS_LOG);
			MDC.remove(CUSTOM_DATA);
        }
	}



	private UserLog getEndUserLog(Object userlog, Object customData) {
	    if (userlog!=null&&userlog instanceof UserLog&&customData!=null) {
	        UserLog newLog = (UserLog)userlog;
	        String msg = JSON.toJSONString(customData);
	        if (msg.length()>LIMIT) {
		        msg = msg.substring(0, LIMIT);
	        }
	        newLog.setMessage(newLog.getMessage()+"-end-"+msg);
	        newLog.setCreateTime(new Date());
	        newLog.setType(AFTER_REQUEST);
	        return newLog;
	    }
	    return null;
    }
	
	


	private UserLog getStartUserLog(HttpServletRequest request) {
	    UserLog userLog = new UserLog();
	    Object principal = SecurityUtils.getPrincipal();
	    String username = "anonymous";
	    if (principal!=null&&principal instanceof SecurityUser) {
	         username = ((SecurityUser)principal).getUsername();
	    }
	    userLog.setUsername(username);
	    String msg = JSON.toJSONString(LogGenerator.next(request));
	    if (msg.length()>LIMIT) {
	        msg = msg.substring(0, LIMIT);
        }
	    userLog.setMessage("-start-"+msg);
	    userLog.setCreateTime(new Date());
	    userLog.setType(BEFORE_REQUEST);
	    return userLog;
    }


}
