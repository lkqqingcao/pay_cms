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

import com.mobogenie.pay.auth.domain.Resource;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Repository
public interface ResourceMapper {
	
	List<Resource> query(@Param("resource")Resource resource,@Param("_offset")Integer _offset,@Param("_limit")Integer pageSize);
	
	Resource queryById(@Param("resourceId")Integer resourceId);
	
	int  count(Resource resource);
	
	int insert(Resource resource);
	
	int update(Map<String, String> map);
}
