/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.framework.util;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class RetMsg {
	private Integer code = 200;
	private String  msg;
	private  Object data;
	private static final RetMsg DEFAULT_RETMSG = RetMsg.newInstance(200, "ok"); 
	public RetMsg(Integer code,String msg){
		this.code = code;
		this.msg  = msg;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public static RetMsg newInstance(Integer code,String msg){
		return new RetMsg(code, msg);
	}
	
	public static RetMsg getDefault(){
		return DEFAULT_RETMSG;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
