package com.mobogenie.pay.statistics.domain;

import com.mobogenie.pay.domain.BaseDomain;

public class Statistics  extends BaseDomain{
	private String produceName; //商品名称
	private String country;//地区
	private Long amount;//价格
	private Long amountSum;//下载量
	private Integer mtypeCode; //类型
	private Integer typeCode; //下载量
	private String  lastupdate;//统计时间 
	public String getLastupdate() {
		return lastupdate;
	}
	public void setLastupdate(String lastupdate) {
		this.lastupdate = lastupdate;
	}
	public String getProduceName() {
		return produceName;
	}
	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getAmountSum() {
		return amountSum;
	}
	public void setAmountSum(Long amountSum) {
		this.amountSum = amountSum;
	}
	public Integer getMtypeCode() {
		return mtypeCode;
	}
	public void setMtypeCode(Integer mtypeCode) {
		this.mtypeCode = mtypeCode;
	}
	public Integer getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(Integer typeCode) {
		this.typeCode = typeCode;
	}

	
	

}
