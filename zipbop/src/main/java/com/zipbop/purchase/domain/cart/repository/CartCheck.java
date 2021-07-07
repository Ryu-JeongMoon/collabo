package com.zipbop.purchase.domain.cart.repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartCheck {

    private int id;
    private String member_id;
    private String name;
    private int price;
    private int product_count;
    private int total_money;
}
