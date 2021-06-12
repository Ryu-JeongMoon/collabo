package com.servlet.attendance.vo;

public class AttVO {
	
	
	private String a_idx, available, status, a_title, a_content, a_type,
	a_writer, user_id, write_date, mod_date, ori_name, file_name;

	public String getA_idx() {
		return a_idx;
	}

	public void setA_idx(String a_idx) {
		this.a_idx = a_idx;
	}

	public String getAvailable() {
		return available; 
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public String getA_writer() {
		return a_writer;
	}

	public void setA_writer(String a_writer) {
		this.a_writer = a_writer;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getMod_date() {
		return mod_date;
	}

	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "AttVO [a_idx=" + a_idx + ", available=" + available + ", status=" + status + ", a_title=" + a_title
				+ ", a_content=" + a_content + ", a_type=" + a_type + ", a_writer=" + a_writer + ", user_id=" + user_id
				+ ", write_date=" + write_date + ", mod_date=" + mod_date + ", ori_name=" + ori_name + ", file_name="
				+ file_name + "]";
	}
 
	
	
	
}
