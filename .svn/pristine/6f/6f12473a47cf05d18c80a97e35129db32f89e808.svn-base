package com.mobogenie.framework.beans;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.annotation.JSONType;

/**
 * 
 * 
 * @author wanghongfeng
 * @date 2014年8月9日
 */
@JSONType(ignores={"startTime","endTime","beginTime","overTime"})
public class UserLog {
	private Integer id;
	private String username;
	private String message;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date   createTime;
	private String beginTime;
	private String overTime;
	
	@DateTimeFormat(pattern="dd/mm/yyyy HH:mm:ss")
	private Date   startTime;
	@DateTimeFormat(pattern="dd/mm/yyyy HH:mm:ss")
	private Date   endTime;
	private Integer type;
	
	private Integer appId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getOverTime() {
		return overTime;
	}
	public void setOverTime(String overTime) {
		this.overTime = overTime;
	}
	public Integer getAppId() {
		return appId;
	}
	public void setAppId(Integer appId) {
		this.appId = appId;
	}
	/**
	 * work for log4j  
	 */
	public String toString(){
		return JSON.toJSONString(this);
	}
	

}
