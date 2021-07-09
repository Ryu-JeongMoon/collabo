package com.zipbop.purchase.web.controller;

import com.zipbop.member.domain.member.Member;
import com.zipbop.purchase.domain.entity.Cart;
import com.zipbop.purchase.domain.entity.CartCheck;
import com.zipbop.purchase.domain.repository.MybatisCartRepository;
import com.zipbop.purchase.domain.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;

    @GetMapping("/list")
    public String list(HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginMember");

        List<CartCheck> cartChecks = cartService.getListByMemberId(loginMember.getId());

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        model.addAttribute("member_id", loginMember.getId());
        model.addAttribute("sum", sum);
        model.addAttribute("cartChecks", cartChecks);

        return "purchase/cart/cartList";
    }

    @PostMapping("/insert")
    public String insert(@ModelAttribute Cart cart, HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        cart.setMember_id(loginMember.getId());

        cartService.insert(cart);

        int id = cart.getProduct_id();

        return "redirect:/product/productDetail/" + id;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id, HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        Cart cart = cartService.findById(id);

        if (!cart.getMember_id().equals(loginMember.getId())) {
            return "redirect:/product/productList";
        }

        cartService.delete(id);

        List<CartCheck> cartChecks = cartService.getListByMemberId(cart.getMember_id());

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        model.addAttribute("member_id", loginMember.getId());
        model.addAttribute("sum", sum);
        model.addAttribute("cartChecks", cartChecks);

        return "purchase/cart/cartList";

    }

    @RequestMapping("/deleteAll/{member_id}")
    public String deleteAll(@PathVariable String member_id, @ModelAttribute Cart cart, HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");

        if(!member_id.equals(loginMember.getId())) {
            return "redirect:/cart/list";
        }

        cartService.deleteAll(member_id);

        return "redirect:/cart/list";
    }
}
