package com.mobogenie.framework.util;

import com.google.common.base.Optional;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class PaginationPlain {
	
	public static final int DEFAULT_LIMIT = 20;
	public static final int DEFAULT_PAGE = 1;
	public static final int DEFAULT_OFFSET = 0;
	/**
	 * pagesize
	 */
	private Integer rows;
	/**
	 * pageNum
	 */
	private Integer page;
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public static Integer getOffset(PaginationPlain pagination){
		Optional<PaginationPlain> optional = Optional.fromNullable(pagination);
		if (!optional.isPresent()) {
	        return DEFAULT_OFFSET;
        }
		int rows  =  getLimit(pagination);
		int page  =  Optional.fromNullable(pagination.getPage()).or(DEFAULT_PAGE);
		page  = page <=0?DEFAULT_PAGE:page;
		return (page-1)*rows;
	}
	
	public static Integer getLimit(PaginationPlain pagination){
		Optional<PaginationPlain> optional = Optional.fromNullable(pagination);
		if (!optional.isPresent()) {
	        return DEFAULT_LIMIT;
        }
		int rows  =  Optional.fromNullable(pagination.getRows()).or(DEFAULT_LIMIT);
		rows  = rows <=0?DEFAULT_LIMIT:rows;
		return rows;
	}

}
