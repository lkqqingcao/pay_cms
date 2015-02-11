/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.auth.domain;

import java.util.List;


/**
 * 
 * @author wanghongfeng
 * @date 2014年7月12日
 */
public class User {
	private Integer id;
	private String name;
	private String username;
	private String email;
	private String password;
	private String description;
	private Integer    enable;//0停用,1启用
	private List<Role> roleList;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getEnable() {
		return enable;
	}
	public void setEnable(Integer enable) {
		this.enable = enable;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	@Override
    public String toString() {
	    return "User [id=" + id + ", name=" + name + ", username=" + username + ", email=" + email
	            + ", password=" + password + ", description=" + description + ", enable=" + enable
	            + ", roleList=" + roleList + "]";
    }
	
    public static enum EnableEnum{
    	Enable(1),Disable(0);
    	private Integer value;
    	private EnableEnum(Integer value){
    		this.value = value;
    	}
    	public Integer getValue(){
    		return value.intValue();
    	}
    }
    
//    public static void main(String[] args) {
//	    JSON.
//    }
}
