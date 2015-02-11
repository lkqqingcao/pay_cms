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
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.pay.auth.dao.ResourceMapper;
import com.mobogenie.pay.auth.dao.ResourceRoleMapper;
import com.mobogenie.pay.auth.domain.Resource;
import com.mobogenie.pay.auth.domain.ResourceRole;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Service
public class ResourceService {
	
	@Autowired
	private ResourceMapper resourceMapper;
	
	@Autowired
	private ResourceRoleMapper resourceRoleMapper;
	
	public List<Resource> findAllResource(Resource resource,PaginationPlain pagination){
		return resourceMapper.query(resource,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
	}
	
	public Resource findResource(Integer resourceId){
		 return resourceMapper.queryById(resourceId);
	}
	
	public int count(Resource resource){
		return resourceMapper.count(resource);
	}
	
	public Page<Resource> getResourcePage(Resource resource,PaginationPlain pagination){
		List<Resource> list = resourceMapper.query(resource, PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
		int count = resourceMapper.count(resource);
		Page<Resource> page = new Page<Resource>();
		page.setList(list);
		page.setTotalCount(count);
		return page;
	}
	
	
	public boolean addResouce(Resource resource){
		resource.setIsDelete(0);
		resource.setParentId(0);
		resource.setLevel(1);
		resource.setPath("");
		return resourceMapper.insert(resource)==1;
	}
	
	public boolean updateResource(Resource resource,Integer resoureId){
		Map<String, String> map= Maps.newHashMap();
        try {
	        map = BeanUtils.describe(resource);
        } catch (Exception e) {
        	e.printStackTrace();
        	return false;
        } 
		map.put("id",resoureId+"");
		return resourceMapper.update(map)==1;
	}
	
	public List<ResourceRole> findResourceRoleos(Integer roleId,PaginationPlain pagination){
		return resourceRoleMapper.query(roleId,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
	}
	
	public List<ResourceRole> findResourceRoleosWithNoPage(Integer roleId){
		return resourceRoleMapper.query(roleId,null,null);
	}
	
	public int countResourceRole(Integer roleId){
		return resourceRoleMapper.count(roleId);
	}
	
	public Page<Resource> getResourceRolePage(Integer roleId,PaginationPlain pagination){
		List<Resource> list =  checkResourceRolePage(roleId,pagination);
		Page<Resource> page = new Page<Resource>();
		page.setList(list);
		page.setTotalCount(list.size());
		return page;
	}
	
	
	
 
	public List<Resource> checkResourceRolePage(Integer roleId,PaginationPlain pagination){
		List<Resource> resourceList =  findAllResource(null, pagination);
		List<ResourceRole> list =  findResourceRoleos(roleId, pagination);
		Set<Integer> set = Sets.newHashSet();
		for (ResourceRole resourceRole : list) {
	         set.add(resourceRole.getResourceId());
        }
		for (Resource resource : resourceList) {
	         if (set.contains(resource.getId())) {
	        	 resource.setHasit(true);
            }
        }
		return resourceList;
	}
	
	
	@Transactional
	public boolean updateResourceRole(int roleId,List<Integer> rsList){
		resourceRoleMapper.delete(roleId);
		int second = 0;
		for (Integer rsId : rsList) {
			second+= resourceRoleMapper.insert(roleId, rsId);
        }
		return second==rsList.size();
	}
}
