package com.spring.board.biz;

public class AnswerVO {
	private String answer_no;
	private String writer;
	private String regdate;
	private String text;
	private String board_no;
	
	public String getAnswer_no() {
		return answer_no;
	}
	public void setAnswer_no(String answer_no) {
		this.answer_no = answer_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public AnswerVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "CommentVO [comment_no=" + answer_no + ", writer=" + writer + ", regdate=" + regdate + ", text=" + text
				+ ", board_no=" + board_no + "]";
	}
	
	
	
}
