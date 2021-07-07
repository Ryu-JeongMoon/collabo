package com.zipbop.funding;

import java.sql.Date;

public class FundingPayVO {

	private int pay_no;
	private int product_no;
	private String total_sum;
	private String name;
	private String phone;
	private String address;
	private String id;
	private String choice_reward;
	private Date pay_date;
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChoice_reward() {
		return choice_reward;
	}
	public void setChoice_reward(String choice_reward) {
		this.choice_reward = choice_reward;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	@Override
	public String toString() {
		return "FundingPayVO [pay_no=" + pay_no + ", product_no=" + product_no + ", total_sum=" + total_sum + ", name="
				+ name + ", phone=" + phone + ", address=" + address + ", id=" + id + ", choice_reward=" + choice_reward
				+ ", pay_date=" + pay_date + "]";
	}
}
