package com.zipbop.purchase.domain.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Cart {

    private int id; //장바구니 번호
    private String member_id; //회원 아이디
    private int product_id; //상품 번호
    private int product_count;

}
