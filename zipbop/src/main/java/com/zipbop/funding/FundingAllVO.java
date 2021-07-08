package com.zipbop.funding;

import java.sql.Date;
import java.time.LocalDateTime;

public class FundingAllVO {
	
	//FundingOpenVO
	private int product_no;
	private String product_name;
	private String id;
	private Date deadLine;
	private int goal_money;
	private String content;
	private String region;
	private String d_day;  //db 칼럼 x
	private int save_money;
	private int supporter;
	private String fileName;
	private int percent;
	
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
	private String choice_reward;
	private LocalDateTime pay_date;
	
	//MemberVO
	private String license;
	
	public FundingAllVO() {
		
	}
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
	public int getSave_money() {
		return save_money;
	}
	public void setSave_money(int save_money) {
		this.save_money = save_money;
	}
	public int getSupporter() {
		return supporter;
	}
	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public int getGoal_money() {
		return goal_money;
	}
	public void setGoal_money(int goal_money) {
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
	public String getChoice_reward() {
		return choice_reward;
	}
	public void setChoice_reward(String choice_reward) {
		this.choice_reward = choice_reward;
	}
	public LocalDateTime getPay_date() {
		return pay_date;
	}
	public void setPay_date(LocalDateTime pay_date) {
		this.pay_date = pay_date;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	@Override
	public String toString() {
		return "FundingAllVO [product_no=" + product_no + ", product_name=" + product_name + ", id=" + id
				+ ", deadLine=" + deadLine + ", goal_money=" + goal_money + ", content=" + content + ", region="
				+ region + ", d_day=" + d_day + ", save_money=" + save_money + ", supporter=" + supporter
				+ ", fileName=" + fileName + ", percent=" + percent + ", reward_no=" + reward_no + ", reward_name="
				+ reward_name + ", reward_price=" + reward_price + ", pay_no=" + pay_no + ", total_sum=" + total_sum
				+ ", name=" + name + ", phone=" + phone + ", address=" + address + ", choice_reward=" + choice_reward
				+ ", pay_date=" + pay_date + ", license=" + license + "]";
	}
	
	public void Data() {
		percent = (int)(Math.ceil((double)save_money) / (double)goal_money * 100);
	}
}
