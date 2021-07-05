package com.zipbop.funding;

import java.sql.Date;

public class FundingAllVO {

	//FundingOpenVO
	private int product_no;
	private String product_name;
	private String id;
	private Date deadLine;
	private String goal_money;
	private String content;
	private String region;
	private String d_day;  //db 칼럼 x
	private String save_money;
	private int supporter;
	private String pimg_no;
	
	//FundingRewardVO
	private int reward_no;
	private String reward_name;
	private String reward_price;
	
	//FundingPayVO
	private int pay_no;
	private String total_sum;
	private String name;
	private String phone;
	private String address;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	public String getSave_money() {
		return save_money;
	}
	public void setSave_money(String save_money) {
		this.save_money = save_money;
	}
	public int getSupporter() {
		return supporter;
	}
	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}
	public String getPimg_no() {
		return pimg_no;
	}
	public void setPimg_no(String pimg_no) {
		this.pimg_no = pimg_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}
	public String getGoal_money() {
		return goal_money;
	}
	public void setGoal_money(String goal_money) {
		this.goal_money = goal_money;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReward_no() {
		return reward_no;
	}
	public void setReward_no(int reward_no) {
		this.reward_no = reward_no;
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getTotal_sum() {
		return total_sum;
	}
	public void setTotal_sum(String total_sum) {
		this.total_sum = total_sum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "FundingAllVO [product_no=" + product_no + ", d_day=" + d_day + ", save_money=" + save_money
				+ ", supporter=" + supporter + ", pimg_no=" + pimg_no + ", product_name=" + product_name + ", id=" + id
				+ ", deadLine=" + deadLine + ", goal_money=" + goal_money + ", content=" + content + ", region="
				+ region + ", reward_no=" + reward_no + ", reward_name=" + reward_name + ", reward_price="
				+ reward_price + ", pay_no=" + pay_no + ", total_sum=" + total_sum + ", name=" + name + ", phone="
				+ phone + ", address=" + address + "]";
	}
}
