package com.mobogenie.pay.statistics.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mobogenie.framework.util.PageData;
import com.mobogenie.pay.statistics.domain.Statistics;
import com.mobogenie.pay.statistics.service.StatisticsService;

@RequestMapping("statistics")
@Controller
public class StatisticsController {
	@Autowired
	private StatisticsService statisService;
	
	 /*
	 * 查询付费下载金额总数前十名数据 
	 */
	@RequestMapping("qeuryAmouTop10")
	public String queryAmouTop10(Statistics statics,HttpServletRequest request,Model modelMap){
	PageData<Statistics> pageData = statisService.getPageData(statics);
	modelMap.addAttribute("statisList", pageData);

	return  "statistics/ordeCharts";
	}
	 /*
	 * 查询付费下载数量总数前十名数据 
	 */
	@RequestMapping("qeuryNumTop10")
	public @ResponseBody JSONObject queryNumTop10(Model model){		
	  List<Statistics> orderNumTop10=	statisService.queryOrderNumForTop10();
	  List<Statistics> orderAmountTop10=	statisService.queryOrderForTop10();
	  JSONObject jsonStrs = new JSONObject();   
	  jsonStrs.put("amountTopkey",orderAmountTop10);
	  jsonStrs.put("parnumTop",orderNumTop10);
	  return jsonStrs;
	}
	

}
