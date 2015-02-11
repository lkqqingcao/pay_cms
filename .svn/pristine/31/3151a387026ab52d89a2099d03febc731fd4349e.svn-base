package com.mobogenie.pay.domain;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.mobogenie.framework.util.Pagination;

/**
 * @Description	表映射对象的基类，包含通用的对象
 * @ClassName	BaseDomain
 * @Date		Dec 17, 2013 6:00:17 PM
 * @Author		sunyunfang@cyou-inc.com
 * Copyright (c) All Rights Reserved, 2013.
 */
public class BaseDomain{
    private static final Logger LOGGER = LoggerFactory.getLogger(BaseDomain.class);
    
    protected String region;
    protected String msg;
    protected Integer count;
    protected Integer pageNum;
    protected Integer pageSize;
    protected Integer extOffset;
    protected Integer extLimit;
    protected String  extStartTimeStr;
    protected String  extEndTimeStr;
    protected Date    startTime;
    protected Date    endTime;
    protected List<String> orderbys;
    protected MultipartFile file;
    protected List<MultipartFile> files;
    protected long ts;
    private Integer extQt;//列表query type,0 返回整个页面1只返回table html，默认0
	
	public long getTs() {
		return System.currentTimeMillis();
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getPageSize() {
		return pageSize==null ? Pagination.DEFAULT_PAGE_SIZE:pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNum() {
		return (pageNum==null||pageNum<1) ? 1:pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Date getCurrTime() {
		return new Date();
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getExtOffset() {
		if (extOffset==null) {
			extOffset = (getPageNum()-1)*getPageSize()+1;
        }
		return extOffset;
	}
	public void setExtOffset(Integer extOffset) {
		this.extOffset = extOffset;
	}
	public Integer getExtLimit() {
		if (extLimit==null) {
	        extLimit = getPageSize();
        }
		return extLimit;
	}
	public void setExtLimit(Integer extLimit) {
		this.extLimit = extLimit;
	}
	public String getExtStartTimeStr() {
		return extStartTimeStr;
	}
	public void setExtStartTimeStr(String extStartTimeStr) {
		this.extStartTimeStr = extStartTimeStr;
		if (StringUtils.isNotBlank(extStartTimeStr)) {
		    try {
		    	startTime = (DateUtils.parseDate(extStartTimeStr,"MM/dd/yyyy HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
            } catch (ParseException e) {
	            LOGGER.error(e.getMessage(),e);
            }
		}
	}
	
	public String getExtEndTimeStr() {
		return extEndTimeStr;
	}
	
	public void setExtEndTimeStr(String extEndTimeStr) {
		this.extEndTimeStr = extEndTimeStr;
		if (StringUtils.isNotBlank(extEndTimeStr)) {
		    try {
		    	endTime = (DateUtils.parseDate(extEndTimeStr,"MM/dd/yyyy HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
            } catch (ParseException e) {
	            LOGGER.error(e.getMessage(),e);
            }
		}
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
	public List<String> getOrderbys() {
		return orderbys;
	}
	public void setOrderbys(List<String> orderbys) {
		this.orderbys = orderbys;
	}
	public void setTs(long ts) {
		this.ts = ts;
	}
	public Integer getExtQt() {
		return extQt;
	}
	public void setExtQt(Integer extQt) {
		this.extQt = extQt;
	}
	
	
	
}
