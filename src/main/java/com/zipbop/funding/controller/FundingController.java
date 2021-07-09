package com.zipbop.funding.controller;

import com.zipbop.funding.domain.*;
import com.zipbop.funding.service.FundingService;
import com.zipbop.member.domain.member.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@SessionAttributes
@RequiredArgsConstructor
@RequestMapping("/funding")
public class FundingController {

    private final FundingService fundingService;

    @GetMapping("/fundingList")
    public String startPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if(loginMember != null) {
            String license = loginMember.getLicense();
            model.addAttribute("license", license);
        }
        return "funding/fundingList";
    }

    @RequestMapping("/getBoard")
    public String getBoard(@RequestParam int product_no, Model model) {
        FundingAllVO funding = fundingService.getBoard(product_no);
        funding.Data();

        String rewardName = fundingService.getRewardName(product_no);
        String rewardPrice = fundingService.getRewardPrice(product_no);

        String[] rewardNameList = rewardName.split(",");
        String[] rewardPriceList = rewardPrice.split(",");

        HashMap<String, String> name_price_map = new HashMap<>();
        for (int i = 0; i < rewardNameList.length; i++) {
            name_price_map.put(rewardNameList[i], rewardPriceList[i]);
        }

        model.addAttribute("funding", funding);
        model.addAttribute("name_price_map", name_price_map);
        return "funding/fundingDetail";
    }

    @GetMapping("/fundingOpen")
    public String getLicense(@ModelAttribute MemberVO memberVO) {

        return "funding/fundingOpen";
    }

    @RequestMapping("/insertBoard")
    public String insertBoard(@ModelAttribute FundingAllVO fundingAllVO, MultipartHttpServletRequest mpRequest) throws Exception, IOException {

        MultipartFile file = mpRequest.getFile("pimg_no");

        if(file.getOriginalFilename() != "" ) {
            String fileName = file.getOriginalFilename();
            file.transferTo(new File("/Users/ryujeongmoon/Downloads/upload/" + fileName));
            fundingAllVO.setFileName(fileName);
        }

        fundingService.insertBoard(fundingAllVO);
        return "funding/fundingList";
    }

    @RequestMapping("/deleteBoard")
    public String deleteBoard(FundingOpenVO fundingOpenVO) {
        fundingService.deleteBoard(fundingOpenVO);
        return "funding/fundingList";
    }

    @GetMapping("/fundingUpdate")
    public String updateForm() {
        return "funding/fundingUpdate";
    }

    @GetMapping("/updateBoard")
    public String update(FundingOpenVO fundingOpenVO, FundingRewardVO fundingRewardVO) {
        fundingService.updateBoard(fundingOpenVO, fundingRewardVO);
        return "funding/fundingList";
    }

    @RequestMapping("/fundingEnter")
    public String totalSum(@RequestParam("product_no") int product_no, HttpServletRequest request, Model model) {

        String totalSum = request.getParameter("totalSum");
        List<String> list = new ArrayList<>();

        for (int i = 0; i < 10; i++)
            if (request.getParameter("list" + i) != null)
                list.add(request.getParameter("list" + i));

        model.addAttribute("totalSum", totalSum);
        model.addAttribute("list", list);
        model.addAttribute("product_no", product_no);
        return "funding/fundingEnter";
    }

    @PostMapping("/fundingPayment")
    public String insertPay(@ModelAttribute FundingAllVO fundingAllVO, Model model) {

        fundingService.insertPay(fundingAllVO);
        String chk = fundingService.getPayChk(fundingAllVO.getPay_no());
        model.addAttribute("chk", chk);
        return "funding/payChk";
    }

    @RequestMapping("/allPayList")
    public String getPayList(FundingAllVO fundingAllVO, Model model) {

        List<FundingPayVO> pays = fundingService.getPayList(fundingAllVO.getId());
        model.addAttribute("pays", pays);
        return "funding/allPayList";
    }
}
