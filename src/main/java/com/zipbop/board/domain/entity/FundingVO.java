package com.zipbop.board.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FundingVO {

    private String product_no;
    private String product_name;
    private String id;
    private String deadline;
    private int goal_money;
    private String content;
    private String region;
    private int save_money;
    private String supporter;
    private String pimg_no;
    private int percent;

    public void data() {
        percent = (int) (Math.ceil((double) save_money / (double) goal_money * 100));
    }

}
