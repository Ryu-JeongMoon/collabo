package com.zipbop.purchase.web.controller;

import com.zipbop.purchase.domain.entity.Product;
import com.zipbop.purchase.domain.repository.MybatisProductRepository;
import com.zipbop.purchase.domain.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;
    private final MybatisProductRepository productRepository;

    @GetMapping("/productList")
    public String productList(Model model){
        List<Product> list = productRepository.findAll();
        model.addAttribute("list", list);
        return "purchase/product/productList";
    }

    @GetMapping("/productDetail/{id}")
    public String productDetail(@PathVariable int id, Model model) {

        Product detailProduct = productService.findOneById(id);
        model.addAttribute("product", detailProduct);
        return "purchase/product/ProductDetail";
    }

}
