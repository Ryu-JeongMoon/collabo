package com.zipbop.board.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PurchaseVO {

	private String id;
	private String name;
	private String price;
	private String description;
	private String url;
	private String regdate;
	
}
