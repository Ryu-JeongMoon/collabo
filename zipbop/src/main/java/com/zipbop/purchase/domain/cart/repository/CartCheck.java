package com.zipbop.purchase.domain.cart.repository;

import lombok.Getter;
import lombok.Setter;

//장바구니 확인
@Getter
@Setter
public class CartCheck {

    private int id; //장바구니 번호
    private String member_id; //회원 아이디
    private String name; //상품 이름
    private int price; //상품 가격
    private int product_count; //상품 수량
    private int total_money; // 장바구니 금액 합계
}
