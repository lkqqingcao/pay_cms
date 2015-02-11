/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.auth.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.mobogenie.framework.beans.UserLog;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.pay.auth.dao.UserLogMapper;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Service
public class UserLogService {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserLogService.class);

	@Autowired
    private UserLogMapper userLogMapper;
	
	public List<UserLog> findUserLogList(UserLog userlog,PaginationPlain pagination){
         return userLogMapper.query(userlog, PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
	}
	
	public Integer count(UserLog userlog){
         return userLogMapper.count(userlog);
	}
	
	public Page<UserLog> getPage(UserLog userlog,PaginationPlain pagination){
		Page<UserLog> page = new Page<UserLog>();
		page.setTotalCount(count(userlog));
		if (userlog.getAppId()==null||userlog.getAppId()==0) {
	        userlog.setAppId(null);
        }
		List<UserLog> list = findUserLogList(userlog,pagination);
		for (UserLog item : list) {
	         item.setCreateTime(item.getCreateTime());
        }
		page.setList(list);
		return page;
	}
	
	@Async
	public void addUserLog(UserLog userlog){
		if (userlog.getAppId()==null) {
	        userlog.setAppId(0);
        }
		try {
			userLogMapper.insert(userlog);
        } catch (Exception e) {
	       LOGGER.error(e.getMessage(), e);
        }
	}
	
}
