package com.zipbop.funding.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class FundingRewardVO {
	
	private int reward_no;
	private int product_no;
	private String reward_name;
	private String reward_price;

}
