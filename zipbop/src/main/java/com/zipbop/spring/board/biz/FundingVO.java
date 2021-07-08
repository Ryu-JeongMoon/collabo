package com.spring.board.biz;

public class FundingVO {
	private String product_no;
	private String product_name;
	private String id;
	private String deadline;
	private int goal_money;
	private String content;
	private String region;
	private int save_money;
	private String supporter;
	private String pimg_no;
	private int percent;
	
	public FundingVO() {
	
	}
	
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;	
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
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
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getSave_money() {
		return save_money;
	}
	public void setSave_money(int save_money) {
		this.save_money = save_money;
	}
	public String getSupporter() {
		return supporter;
	}
	public void setSupporter(String supporter) {
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
		return "FundingVO [product_no=" + product_no + ", product_name=" + product_name + ", id=" + id + ", deadline="
				+ deadline + ", goal_money=" + goal_money + ", content=" + content + ", region=" + region
				+ ", save_money=" + save_money + ", supporter=" + supporter + ", pimg_no=" + pimg_no + ", percent="
				+ percent + "]";
	}
	
	public void Data() {
		
			percent = (int)(Math.ceil((double)save_money / (double)goal_money*100));
		
	}
	
}
