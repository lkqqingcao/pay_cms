/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.auth.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mobogenie.framework.beans.UserLog;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Repository
public interface UserLogMapper {
 
	List<UserLog> query(@Param("userlog")UserLog userlog,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	UserLog queryByUsername(@Param("username")String username);
	
	int   count(@Param("userlog")UserLog userlog);
	
	int   insert(UserLog userlog);
}
