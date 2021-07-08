package com.spring.board.biz;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Criteria {
	
	//페이징 조건
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	private String flag_nq;

	public String getFlag_nq() {
		return flag_nq;
	}

	public void setFlag_nq(String flag_nq) {
		this.flag_nq = flag_nq;
	}

	@JsonIgnore //JSON 데이터 변경 제회
	private String searchCondition;
	@JsonIgnore
	private String searchKeyword;  
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 9;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 9;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
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

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ ", flag_nq=" + flag_nq + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ "]";
	}

	
	
}