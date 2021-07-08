package com.spring.board.biz;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BoardVO {
	
	private String writer;
	private String no;
	private String title;
	private String content;
	private String regdate;
	private String hit;
	private char flag_nq;
	
	@JsonIgnore //JSON 데이터 변경 제회
	private String searchCondition="TITLE";
	@JsonIgnore
	private String searchKeyword="";	
	
	public BoardVO() {
		System.out.println("VO 생성");
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public char getFlag_nq() {
		return flag_nq;
	}

	public void setFlag_nq(char flag_nq) {
		this.flag_nq = flag_nq;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

//	public MultipartFile getUploadFile() {
//		return uploadFile;
//	}
//
//	public void setUploadFile(MultipartFile uploadFile) {
//		this.uploadFile = uploadFile;
//	}
	
	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "qnaVO [writer=" + writer + ", no=" + no + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", hit=" + hit + ", flag_nq=" + flag_nq + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", uploadFile=" + "]"; //uploadFile + 
	}
	
	
}
