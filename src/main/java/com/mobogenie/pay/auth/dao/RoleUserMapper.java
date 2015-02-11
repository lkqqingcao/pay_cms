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

import com.mobogenie.pay.auth.domain.RoleUser;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Repository
public interface RoleUserMapper {
	
	List<RoleUser> query(@Param("userId")Integer userId,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	int count(@Param("userId")Integer userId);

	int insert(@Param("userId")Integer userId,@Param("roleId")Integer roleId);
	
	int delete(@Param("userId")Integer userId);

	List<RoleUser> queryNotAdmin(@Param("userId")Integer userId,@Param("roleId")Integer roleId,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	List<RoleUser> queryUserByRoleId(@Param("roleId")Integer roleId);
	
}
