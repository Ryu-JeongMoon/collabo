package com.zipbop.funding.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FundingPayVO {

    private int pay_no;
    private int product_no;
    private String total_sum;
    private String name;
    private String phone;
    private String address;
    private String id;
    private String choice_reward;
    private String pay_date;

}
