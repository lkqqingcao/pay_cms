package com.mobogenie.pay.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobogenie.framework.util.PageData;
import com.mobogenie.pay.game.dao.GameMapper;
import com.mobogenie.pay.game.domain.Game;
import com.mobogenie.pay.statistics.dao.StatisticsMapper;
import com.mobogenie.pay.statistics.domain.Statistics;
;

@Service
public class StatisticsService {
	@Autowired
	private StatisticsMapper statMapper;
	/**
	 * 
	 * 查询数据下载金额前十名数据
	 * 创建人：  wuql@cyou-inc.com
	 * 创建时间：2014-10-10  下午4:59:50
	 */
	public  List<Statistics> queryOrderForTop10(){
			
		
		return statMapper.queryProduceAmountFor10();
	    
	}
	/**
	 * 
	 * 查询数据下载前十名数据
	 * 创建人：  wuql@cyou-inc.com
	 * 创建时间：2014-10-10  下午4:59:50
	 */
	public  List<Statistics> queryOrderNumForTop10(){
			
		
		return statMapper.queryProduceNumFor10();
	    
	}
	//查询列表
	public PageData<Statistics> getPageData(Statistics statics){
		
		return PageData.buildPage(getList(statics),getCount(statics),statics.getPageSize(), statics.getPageNum());
	}
	
	
	public List<Statistics> getList(Statistics statics){
		return  statMapper.query(statics);
	}
	
	public Integer getCount(Statistics statics){
		return  statMapper.count(statics);
	}
	
}
