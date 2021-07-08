package com.spring.board.biz;

public class PerchaseVO {
	private String id;
	private String name;
	private String price;
	private String description;
	private String url;
	private String regdate;
	
	public PerchaseVO() {
		System.out.println("perchase vo 생성");
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "PerchaseVO [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", url=" + url + ", regdate=" + regdate + "]";
	}
	
	
}
