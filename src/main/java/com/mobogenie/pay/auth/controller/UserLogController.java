package com.mobogenie.pay.auth.controller;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobogenie.framework.beans.UserLog;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.pay.auth.domain.User;
import com.mobogenie.pay.auth.service.UserLogService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年8月11日
 */
@Controller
@RequestMapping("auth/userlog")
public class UserLogController{

	private static Logger logger = LoggerFactory.getLogger(UserLogController.class);
   
	@Autowired
	private UserLogService userLogService;
	
	
	@ResponseBody
	@RequestMapping(value="doList",produces=MediaType.APPLICATION_JSON_VALUE)
    public Page<UserLog> doList(UserLog userLog,PaginationPlain pagination){
		processDate(userLog);
		return userLogService.getPage(userLog, pagination);
	}
	
	@RequestMapping("toList")
	public String toList(User user){
		return "/auth/userlog";
	}
	
	private void processDate(UserLog userLog){
		if (StringUtils.isNotBlank(userLog.getBeginTime())) {
			try {
				userLog.setStartTime((DateUtils.parseDate(userLog.getBeginTime(),
				        "MM/dd/yyyy HH:mm:ss","yyyy-MM-dd HH:mm:ss")));
			} catch (ParseException e) {
				logger.error(e.getMessage(), e);
			}
		}
		else {
			userLog.setStartTime(DateUtils.addMonths(new Date(), -1));
		}
		if (StringUtils.isNotBlank(userLog.getOverTime())) {
			try {
				userLog.setEndTime((DateUtils.parseDate(userLog.getOverTime(),
				        "MM/dd/yyyy HH:mm:ss","yyyy-MM-dd HH:mm:ss")));
			} catch (ParseException e) {
				logger.error(e.getMessage(), e);
			}
		}
	}

	

}
