package com.zipbop.purchase.domain.cart;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cart {

    private int id; //장바구니 번호
    private String member_id; //회원 아이디
    private int product_id; //상품 번호
    private int product_count;

    //join 고려해서 미리 추가함
    private String product_name; //상품이름
    private int product_price; //상품가격
    private int totalMoney; //장바구니 총 가격
}
