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

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.mobogenie.framework.util.Page;
import com.mobogenie.framework.util.PaginationPlain;
import com.mobogenie.pay.auth.dao.UserMapper;
import com.mobogenie.pay.auth.domain.Role;
import com.mobogenie.pay.auth.domain.RoleUser;
import com.mobogenie.pay.auth.domain.User;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
@Service
public class UserService {

	@Autowired
    private UserMapper userMapper;
	
	@Autowired
	private RoleService roleService;
	
	public List<User> findUserList(User user,PaginationPlain pagination,boolean excludeAdmin){
		if (!excludeAdmin) {
			return userMapper.query(user,PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination),null);
        }else {
			List<RoleUser> list = roleService.findRoleUserByRoleId(roleService.getAdminRoleId());
			List<Integer> notInList = Lists.newArrayList();
			for (RoleUser roleUser : list) {
	             notInList.add(roleUser.getUserId());   
            }
			return userMapper.query(user, PaginationPlain.getOffset(pagination), PaginationPlain.getLimit(pagination),notInList.isEmpty()?null:notInList.toArray(new Integer[]{}));
		}
	}
	
	public Integer count(boolean excludeAdmin){
		if (!excludeAdmin) {
			return userMapper.count(null,null);
        }else {
        	List<RoleUser> list = roleService.findRoleUserByRoleId(roleService.getAdminRoleId());
			List<Integer> notInList = Lists.newArrayList();
			for (RoleUser roleUser : list) {
	             notInList.add(roleUser.getUserId());   
            }
			return userMapper.count(null, notInList.isEmpty()?null:notInList.toArray(new Integer[]{}));
		}
	}
	
	public Page<User> getUserPage(User user,PaginationPlain pagination,boolean excludeAdmin){
		 List<User> list = findUserList(user, pagination,excludeAdmin);
		 int count = count(excludeAdmin);
		 Page<User> page = new Page<User>();
		 page.setList(list);
		 page.setTotalCount(count);
		 return page;
	}
	
	
	public User findUser(String username){
		Preconditions.checkNotNull(username);
		return userMapper.queryByUsername(username);
	}
	
	public User findUserWithRoles(String username){
		Preconditions.checkNotNull(username);
	    User user =	findUser(username);
	    if (user==null) {
	        return null;
        }
	    List<RoleUser> roleUsers =  roleService.findRoleUserListNoPage(user.getId());
	    List<Role> roles = Lists.newArrayList();
	    if (!CollectionUtils.isEmpty(roleUsers)) {
	    	for (RoleUser roleUser : roleUsers) {
	    		roles.add(roleService.findRole(roleUser.getRoleId()));
            }
        }
	    user.setRoleList(roles);
	    return user;
	}
	
	
	public boolean updateUser(User user,Integer userId){
		Map<String, String> map= Maps.newHashMap();
        try {
	        map = BeanUtils.describe(user);
        } catch (Exception e) {
        	e.printStackTrace();
        	return false;
        } 
		map.put("id",userId+"");
		return userMapper.update(map)==1;
	}
	
	public boolean addUser(User user){
		 user.setEnable(1);
		 return userMapper.insert(user)==1;
	}
	
}
