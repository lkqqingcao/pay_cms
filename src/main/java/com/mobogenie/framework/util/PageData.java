
package com.mobogenie.framework.util;


import java.util.List;

/**
 * 
 * @param <T>
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class PageData<T> {

    private List<T> list;

    private Pagination pagination;

    public PageData(Pagination pagination,List<T> list) {
        this.pagination = pagination;
        this.list = list;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	public static <T> PageData<T> buildPage(List<T> list,Integer count,Integer pageSize,Integer pageNum){
		Pagination _pagination = new Pagination(pageSize, pageNum,count,list.size());
		return new PageData<T>(_pagination, list);
	}

}
