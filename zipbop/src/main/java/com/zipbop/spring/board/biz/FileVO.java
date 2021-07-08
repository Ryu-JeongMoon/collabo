package com.spring.board.biz;

public class FileVO {
	private String file_no;
	private String org_file_name;
	private String stored_file_name;
	private String file_size;
	private String regdate;
	private String del_yn;
	private String board_no;
	
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public FileVO() {
		super();
	}

	@Override
	public String toString() {
		return "FileVO [file_no=" + file_no + ", org_file_name=" + org_file_name + ", stored_file_name="
				+ stored_file_name + ", file_size=" + file_size + ", regdate=" + regdate + ", del_yn=" + del_yn
				+ ", board_no=" + board_no + "]";
	}
	
	
	
}
