package com.zipbop.board.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
    private int d_day;

    public void data() throws ParseException {
        percent = (int) (Math.ceil((double) save_money / (double) goal_money * 100));
        Calendar getToday = Calendar.getInstance();
        getToday.setTime(new Date()); //금일 날짜

        String s_date = deadline;
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s_date);
        Calendar cmpDate = Calendar.getInstance();
        cmpDate.setTime(date); //특정 일자

        long diffSec = (cmpDate.getTimeInMillis() - getToday.getTimeInMillis()) / 1000;
        int diffDays = (int) (diffSec / (24*60*60) +1); //일자수 차이

        d_day = diffDays;

    }

}
