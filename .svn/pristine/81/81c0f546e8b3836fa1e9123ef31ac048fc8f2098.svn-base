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

import com.mobogenie.pay.auth.domain.Role;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Repository
public interface RoleMapper {
	
	List<Role> query(@Param("role")Role role,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	List<Role> queryAll();
	
	Role queryById(@Param("roleId")Integer roleId);
	
	int count(Role role);
	
	int update(Map<String, String> map);
	
	int insert(Role role);
	
	List<Role> queryNotAdmin(@Param("role")Role role,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	int countNotAdmin(@Param("role")Role role);
	
}
