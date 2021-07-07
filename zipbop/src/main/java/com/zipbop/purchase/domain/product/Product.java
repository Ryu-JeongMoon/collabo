package com.zipbop.purchase.domain.product;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Product {

    private int id; //상품 번호
    private String name; //상품 이름
    private int price; //상품 가격
    private String description; //상품 설명
    private String url; // 상품 사진이름
    private LocalDateTime regdate; //상품 등록날짜
}
