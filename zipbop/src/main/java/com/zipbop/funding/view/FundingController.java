package com.zipbop.funding.view;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zipbop.funding.FundingAllVO;
import com.zipbop.funding.FundingOpenVO;
import com.zipbop.funding.FundingPayVO;
import com.zipbop.funding.FundingRewardVO;
import com.zipbop.funding.FundingService;

@Controller
@SessionAttributes("funding")
public class FundingController {
	
	@Autowired
	private FundingService fundingService;
	
	public FundingController() {
		System.out.println("---FundingController() 객체 생성");
	} 
	
	@RequestMapping("/getBoard.do")
	public String getBoard(FundingAllVO allvo, Model model) {
		//System.out.println(">> 펀딩게시글 상세보기");
		FundingAllVO funding = fundingService.getBoard(allvo);
		System.out.println("getBoard DB funding: "+funding);
		model.addAttribute("funding", funding); //fundingDetail.jsp에서 funding.~ 이렇게 사용
		
		//rname=reward name
		String rname = fundingService.getRewardName(allvo.getProduct_no());
		//rprice=reward price
		String rprice = fundingService.getRewardPrice(allvo.getProduct_no());
	
		String[] rname_list = rname.split(",");
		String[] rprice_list = rprice.split(",");
		
		HashMap<String, String> name_price_map = new HashMap<>();
		for(int i=0; i<rname_list.length; i++) {
			name_price_map.put(rname_list[i], rprice_list[i]);
			//System.out.println("i : " + i);
			//System.out.println(rname_list[i] +", " + rprice_list[i]);
		}
		model.addAttribute("name_price_map", name_price_map);
		//model.addAttribute("reward", reward);
		return "fundingDetail.jsp";

	}
	@RequestMapping("/insertBoard.do")
	public String insertBoard(FundingAllVO allvo) {
		System.out.println("--펀딩오픈 신청하기");
		System.out.println("allvo: "+allvo);
		fundingService.insertBoard(allvo);
		return "fundingList.jsp";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(FundingOpenVO ovo) {
		System.out.println("--게시글 삭제");
		fundingService.deleteBoard(ovo);
		return "fundingList.jsp";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(FundingOpenVO ovo,FundingRewardVO rvo) {
		System.out.println("--게시글 수정");
		System.out.println("update ovo: "+ovo);
		System.out.println("update rvo: "+rvo);
		fundingService.updateBoard(ovo, rvo);
		return "fundingList.jsp";
	}
	
	@RequestMapping("/fundingEnter.do")
	public String totalSum(HttpServletRequest request, ModelMap model) {
		String totalSum = request.getParameter("totalSum");
		model.addAttribute("totalSum", totalSum);
		//System.out.println("totalSum: "+totalSum);
		return "fundingEnter.jsp";
	}
	
	@RequestMapping("/fundingPayment.do")
	public String insertPay(FundingAllVO allvo) {
		System.out.println("---회원)펀딩 참여");
		System.out.println("allvo: "+allvo);
		fundingService.insertPay(allvo);
		return "fundingList.jsp";
	}
	
	/*
	 * @RequestMapping("/supporterList.do") public List<FundingPayVO>
	 * supporterList(int product_no, Model model) {
	 * System.out.println("----supporterList(product_no)실행");
	 * System.out.println("product_no: "+product_no); return
	 * fundingService.getSupporterList(product_no); }
	 */
	//리워드 리스트 
	//List<FundingRewardVO> reward = fundingService.getRewardList(allvo.getProduct_no());	
	
}

