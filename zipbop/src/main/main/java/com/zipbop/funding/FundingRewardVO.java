package com.zipbop.funding;

public class FundingRewardVO {
	
	private int reward_no;
	private int product_no;
	private String reward_name;
	private String reward_price;
	
	public int getReward_no() {
		return reward_no;
	}
	public void setReward_no(int reward_no) {
		this.reward_no = reward_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getReward_name() {
		return reward_name;
	}
	public void setReward_name(String reward_name) {
		this.reward_name = reward_name;
	}
	public String getReward_price() {
		return reward_price;
	}
	public void setReward_price(String reward_price) {
		this.reward_price = reward_price;
	}
	@Override
	public String toString() {
		return "FundingRewardVO [reward_no=" + reward_no + ", product_no=" + product_no + ", reward_name=" + reward_name
				+ ", reward_price=" + reward_price + "]";
	}
}
