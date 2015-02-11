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

import java.util.List;

import com.google.common.collect.Lists;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class Pagination {
	
	public static final int DEFAULT_LIMIT      = 20;
	public static final int DEFAULT_PAGE       = 1;
	public static final int DEFAULT_OFFSET     = 0;
//	public static final int DEFAULT_PAGE_SIZE  = 50;
	public static final int DEFAULT_PAGE_SIZE  = 20;
	//1...3,4,5,_6_,7,8,9,...11
	public static final int DEFAULT_SPACE_SIZE = 10;
	public static final int DEFAULT_HALF_SIZE  = 5;
	
	private int startIndex;
	private int endIndex;
	private int queryCount;
	private int pageNum;
	private int pageSize;
	private int totalCount;
	private boolean firstPage;
	private boolean endPage;
	private int pageCount;
	private int previousPage;
	private int nextPage;
	private List<Integer> pages =Lists.newArrayList();
	
	
	public Pagination(Integer pageSize,Integer pageNum,Integer totalCount,Integer queryCount){
		this.totalCount = totalCount;
		this.pageSize   = pageSize;
		this.pageNum   = pageNum;
		if (pageNum>0) {
			previousPage = pageNum - 1;
			nextPage = pageNum + 1;
        }
		
		this.queryCount = queryCount;
		if (pageNum>0) {
	        startIndex = (pageNum-1)*pageSize+1;
	        endIndex = startIndex + queryCount-1;
        }
		if (pageNum==1) {
	        firstPage=true;
        }
		if (totalCount>0&&pageSize>0) {
			pageCount = totalCount/pageSize+((totalCount%pageSize==0)?0:1);
        }
		if (pageNum==pageCount) {
	        endPage=true;
        }
		if (pageCount!=0&&pageCount<=1) {
	        firstPage=endPage=true;
        }
		if (totalCount>0) {
	        pages.add(1);
        }
		//before current page
		boolean hasDot = false;
		if (pageCount>DEFAULT_SPACE_SIZE&&pageNum>DEFAULT_HALF_SIZE) {
	        pages.add(0);
	        hasDot=true;
	        pages.add(pageNum-3);
	        pages.add(pageNum-2);
	        pages.add(pageNum-1);
	        pages.add(pageNum);
        }else {
			for (int i = 2; i <= pageNum; i++) {
	            pages.add(i);
            }
		}
		//after current page
		for (int i = pageNum+1; i <= pageCount; i++) {
			if (i>pageNum+(hasDot?3:10-pageNum)) {
	            pages.add(0);
	            pages.add(pageCount);
	            break;
            }
	        pages.add(i);
        }
	}
	
	public Integer getStartIndex() {
		return startIndex;
	}

	public Integer getEndIndex() {
		return endIndex;
	}

	public Integer getQueryCount() {
		return queryCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public Boolean getFirstPage() {
		return firstPage;
	}

	public Boolean getEndPage() {
		return endPage;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public Integer getPreviousPage() {
		return previousPage;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public Integer getNextPage() {
		return nextPage;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
