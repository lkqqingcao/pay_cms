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
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mobogenie.pay.auth.domain.User;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Repository
public interface UserMapper {
 
	List<User> query(@Param("user")User user,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize,@Param("notInList") Integer [] notInList);
	
	User queryByUsername(@Param("username")String username);
	
	int   count(@Param("user")User user,@Param("notInList")Integer[] notInList);
	
	int   update(Map<String, String> map);
	
	int   insert(User user);
}
