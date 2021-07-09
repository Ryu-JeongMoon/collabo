package com.zipbop.funding.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FundingAllVO {

    //FundingOpenVO
    private int product_no;
    private String product_name;
    private String id;
    private Date deadLine;
    private int goal_money; //int
    private String content;
    private String region;
    private String d_day;
    private int save_money; //int
    private int supporter;
    private String fileName;
    private int percent;

    //FundingRewardVO
    private int reward_no;
    private String reward_name;
    private String reward_price;

    //FundingPayVO
    private int pay_no;
    private String total_sum;
    private String name;
    private String phone;
    private String address;
    private String choice_reward;
    private String pay_date;

    //MemberVO
    private String license;

    public void Data() {
        percent = (int) (Math.ceil((double) save_money) / (double) goal_money * 100);
    }
}
