/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.game.domain;

import java.util.Date;

import com.mobogenie.pay.domain.BaseDomain;

/**
 * 
 * @author wanghongfeng
 * @date 2014年9月16日
 */
public class Game extends BaseDomain{

	private Integer id;
	private Date updateTime;
	private Date createTime;
	private Integer auditStatus;
	private Integer isDeleted;
	private String imgPath;
	private String detail;
	private String apkId;
	private Integer mType;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}
	public Integer getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getApkId() {
		return apkId;
	}
	public void setApkId(String apkId) {
		this.apkId = apkId;
	}
	public Integer getmType() {
		return mType;
	}
	public void setmType(Integer mType) {
		this.mType = mType;
	}
	@Override
    public String toString() {
	    return "Game [id=" + id + ", updateTime=" + updateTime + ", createTime=" + createTime
	            + ", auditStatus=" + auditStatus + ", isDeleted=" + isDeleted + ", imgPath="
	            + imgPath + ", detail=" + detail + ", apkId=" + apkId + ", mType=" + mType + "]";
    }
    
	
}
