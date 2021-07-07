package com.zipbop.funding;

import java.sql.Date;

public class FundingOpenVO {
	
	private int product_no;
	private String product_name;
	private String id;
	private Date deadLine;
	private String goal_money;
	private String content;
	private String region;
	private String save_money;
	private int supporter;
	private String pimg_no;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
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
	@Override
	public String toString() {
		return "FundingOpenVO [product_no=" + product_no + ", product_name=" + product_name + ", id=" + id
				+ ", deadLine=" + deadLine + ", goal_money=" + goal_money + ", content=" + content + ", region="
				+ region + ", save_money=" + save_money + ", supporter=" + supporter + ", pimg_no=" + pimg_no + "]";
	}
}
