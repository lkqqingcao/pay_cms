package com.mobogenie.pay.statistics.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mobogenie.pay.game.domain.Game;
import com.mobogenie.pay.statistics.domain.Statistics;


@Repository
public interface StatisticsMapper {
	
	/**
	 * 统计订单中前十名的数据
	 * @return
	 * 创建人：  wuql@cyou-inc.com
	 * 创建时间：2014-10-10  下午3:52:57
	 */
	  
	 List<Statistics> queryProduceAmountFor10();
	 
	 List<Statistics> queryProduceNumFor10();
	 //根据条件查询总数
      List<Statistics> query(Statistics statics);	
	  //根据条件查询总数
       Integer  count(Statistics statics);
	

}
