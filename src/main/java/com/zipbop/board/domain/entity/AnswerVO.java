package com.zipbop.board.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AnswerVO {

	private String answer_no;
	private String writer;
	private String regdate;
	private String text;
	private String board_no;
	
}
