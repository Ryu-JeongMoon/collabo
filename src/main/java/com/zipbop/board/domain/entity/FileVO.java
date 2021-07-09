package com.zipbop.board.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {

	private String file_no;
	private String org_file_name;
	private String stored_file_name;
	private String file_size;
	private String regdate;
	private String del_yn;
	private String board_no;

}
