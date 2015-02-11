package com.mobogenie.pay.auth.domain;
/**
 * 
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class ResourceRole {
    private Integer id;
    private Integer resourceId;
    private Integer roleId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
    
}
