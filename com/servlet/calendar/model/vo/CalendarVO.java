package com.bc.calendar.model.vo;

public class CalendarVO {
	private String project_id;
	private String title;
	private String detail;
	private String  start_date;
	private String end_date;
	private String time;
	private String writer_id;
	private String id;
	private String color;
	private String text_color;
	
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getText_color() {
		return text_color;
	}
	public void setText_color(String text_color) {
		this.text_color = text_color;
	}
	
	public CalendarVO(String project_id, String title, String detail, String start_date, String end_date, String time,
			String writer_id, String id, String color, String text_color) {
		super();
		this.project_id = project_id;
		this.title = title;
		this.detail = detail;
		this.start_date = start_date;
		this.end_date = end_date;
		this.time = time;
		this.writer_id = writer_id;
		this.id = id;
		this.color = color;
		this.text_color = text_color;
	}
	public CalendarVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "CalendarVO [project_id=" + project_id + ", title=" + title + ", detail=" + detail + ", start_date="
				+ start_date + ", end_date=" + end_date + ", time=" + time + ", writer_id=" + writer_id + ", id=" + id
				+ ", color=" + color + ", text_color=" + text_color + "]";
	}
	
}
