package com.mobogenie.pay.game.domain;

public class GameCount {
	public int mtype;
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public  int count;
	public GameCount(int mtype, int count) {
		super();
		this.mtype = mtype;
		this.count = count;
	}
	public GameCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
