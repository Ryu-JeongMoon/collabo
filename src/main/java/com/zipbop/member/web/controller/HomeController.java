package com.zipbop.member.web.controller;

import com.zipbop.funding.repository.FundingDAOMybatis;
import com.zipbop.member.domain.member.Member;
import com.zipbop.member.web.argumentresolver.Login;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class HomeController {

    private final FundingDAOMybatis fundingDAOMybatis;

    @GetMapping("/")
    public String homeLoginV3ArgumentResolver(@Login Member loginMember, HttpSession session, Model model) {

        session.setAttribute("totalFundingCount", fundingDAOMybatis.getTotalFundingCount());
        session.setAttribute("ongoingFundingCount", fundingDAOMybatis.getOngoingFundingCount());
        session.setAttribute("getSuccessfulFundingCount", fundingDAOMybatis.getSuccessfulFundingCount());
        session.setAttribute("getFailureFundingCount", fundingDAOMybatis.getFailureFundingCount());

        if (loginMember == null)
            return "th/home";

        model.addAttribute("member", loginMember);

        return "th/loginHome";
    }
}