package com.zipbop.board.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class BoardVO {

    private String writer;
    private String no;
    private String title;
    private String content;
    private String regdate;
    private String hit;
    private char flag_nq;

    @JsonIgnore
    private String searchCondition = "TITLE";

    @JsonIgnore
    private String searchKeyword = "";

}
