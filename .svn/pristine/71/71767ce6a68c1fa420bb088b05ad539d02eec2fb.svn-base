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
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.pay.auth.dao.RoleMapper;
import com.mobogenie.pay.auth.dao.RoleUserMapper;
import com.mobogenie.pay.auth.domain.Resource;
import com.mobogenie.pay.auth.domain.ResourceRole;
import com.mobogenie.pay.auth.domain.Role;
import com.mobogenie.pay.auth.domain.RoleUser;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Service
public class RoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private RoleUserMapper roleUserMapper;
	
	@Autowired
	private ResourceService resourceService;
	
	
	public List<Role> findRoleList(Role role,PaginationPlain pagination,boolean containAdmin){
		if (containAdmin) {
			return roleMapper.query(role,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
        }else {
			return roleMapper.queryNotAdmin(role, PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
		}
	}
	
	
	
	public List<Role> findAllRoleList(){
		return roleMapper.queryAll();
	}
	
	public Role findRoleWithRs(Integer roleId){
		Role role = findRole(roleId);
		if (role==null) {
	        return null;
        }
		List<ResourceRole> list = resourceService.findResourceRoleosWithNoPage(roleId);
		List<Resource> rslist = Lists.newArrayList();
		for (ResourceRole resourceRole : list) {
			  Resource resource = resourceService.findResource(resourceRole.getResourceId());
			  if (resource!=null) {
				  rslist.add(resource);
              }
        }
		role.setRslist(rslist);
		return role;
	}
	
	
	
	public Role findRole(Integer roleId){
		Preconditions.checkNotNull(roleId);
		return roleMapper.queryById(roleId);
	}
	
	
	public Integer count(Role role,boolean containAdmin){
		if (containAdmin) {
			return roleMapper.count(role);
        }else {
			return roleMapper.countNotAdmin(role);
		}
	}
	
	
	public Page<Role> getRolePage(Role role,PaginationPlain pagination,boolean containAdmin){
		List<Role> list = findRoleList(role,pagination,containAdmin);
		int count = count(role,containAdmin);
		Page<Role> page = new Page<Role>();
		page.setList(list);
		page.setTotalCount(count);
		return page;
	}
	
	public boolean addRole(Role role){
	    return 	roleMapper.insert(role)==1;
	}
	
	public boolean updateRole(Role role,Integer roleId){
		Map<String, String> map= Maps.newHashMap();
        try {
	        map = BeanUtils.describe(role);
        } catch (Exception e) {
        	e.printStackTrace();
        	return false;
        } 
		map.put("roleId",roleId+"");
		return roleMapper.update(map)==1;
	}
	
	
	public Page<Role> getUserRolePage(Integer userId,PaginationPlain pagination,boolean containAdmin){
		List<Role> list = checkUserRoleList(userId,pagination,containAdmin);
		int count = list.size();
		Page<Role> page= new Page<Role>();
		page.setList(list);
		page.setTotalCount(count);
        return page;
	}
	
	
	public List<Role> checkUserRoleList(Integer userId,PaginationPlain pagination,boolean containAdmin){
		List<Role> roleList =  findRoleList(null,pagination,containAdmin);
		List<RoleUser> list = findRoleUserList(userId, pagination,containAdmin);
		Set<Integer> set = Sets.newHashSet();
		for (RoleUser roleUser : list) {
	         set.add(roleUser.getRoleId());
        }
		for (Role role : roleList) {
	         if (set.contains(role.getId())) {
	            role.setHasit(true);
            }
        }
		return roleList;
	}
	
	
	public List<RoleUser> findRoleUserByRoleId(Integer roleId){
		return roleUserMapper.queryUserByRoleId(roleId);
	}
	
	
	
	public List<RoleUser> findRoleUserList(Integer userId,PaginationPlain pagination,boolean containAdmin){
		if (containAdmin) {
			return roleUserMapper.query(userId,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
        }else {
        	Integer adminId = getAdminRoleId();
			return roleUserMapper.queryNotAdmin(userId,adminId,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination));
		}
	}



	public Integer getAdminRoleId() {
	    Role role = new Role();
	    role.setName("ROLE_ADMIN");
	    List<Role> roles = roleMapper.query(role, null, null);
	    Integer adminId = null;
	    if (!CollectionUtils.isEmpty(roles)) {
	        adminId = roles.get(0).getId();
	    }
	    return adminId;
    }
	
	
	
	public List<RoleUser> findRoleUserListNoPage(Integer userId){
		  return roleUserMapper.query(userId,null,null);
	}
	
	public Integer countRoleUser(Integer userId){
		  return roleUserMapper.count(userId);
	}
	
	
	@Transactional
	public boolean addRoleUser(Integer userId,List<Integer> roleIds){
		roleUserMapper.delete(userId);
		int second = 0;
		for (Integer roleId : roleIds) {
			second+=roleUserMapper.insert(userId, roleId);
        }
		return second==roleIds.size();
	}
	

}
