package com.mobogenie.framework.util;

import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 
 * @param <T>
 * @author wanghongfeng
 * @date 2014年7月14日
 */
public class Page<T> {

	@JSONField(name="rows")
    private List<T> list;

	@JSONField(name="total")
    private int totalCount;

    public Page() {
    }

    public Page(int totalCount,List<T> list) {
        this.totalCount = totalCount;
        this.list = list;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
