package com.zipbop.funding.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Date;

@Data @AllArgsConstructor
public class FundingOpenVO {
	
	private int product_no;
	private String product_name;
	private String id;
	private Date deadLine;
	private int goal_money;
	private String content;
	private String region;
	private int save_money;
	private String pimg_no;
	private int percent;
}
