package com.zipbop.funding.view;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	@RequestMapping("login.do")
	public String login(@RequestParam String id, HttpSession session, Model model) {
		System.out.println("Controller ID : " + id);
		String member = fundingService.getMember(id);
		String license = fundingService.getLicense(id);
		if (member != null) {
			session.setAttribute("id", id);
			if(license != null) {
				session.setAttribute("license", license);				
			}
			return "fundingList.jsp";
		} else {
			return "login.jsp";
		}
	}

	@RequestMapping("/getBoard.do")
	public String getBoard(FundingAllVO allvo, Model model) {
		// System.out.println("---펀딩게시글 상세보기");
		
		FundingAllVO funding = fundingService.getBoard(allvo);
		
		//진척도 계산
		funding.Data();
		
		//System.out.println("getBoard DB funding: " + funding);
		model.addAttribute("funding", funding); // fundingDetail.jsp에서 funding.~ 이렇게 사용

		// rname=reward name
		String rname = fundingService.getRewardName(allvo.getProduct_no());
		// rprice=reward price
		String rprice = fundingService.getRewardPrice(allvo.getProduct_no());

		String[] rname_list = rname.split(",");
		String[] rprice_list = rprice.split(",");

		HashMap<String, String> name_price_map = new HashMap<>();
		for (int i = 0; i < rname_list.length; i++) {
			name_price_map.put(rname_list[i], rprice_list[i]);
		}
		model.addAttribute("name_price_map", name_price_map);
		// model.addAttribute("reward", reward);
		return "fundingDetail.jsp";
	}
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(FundingAllVO allvo, MultipartHttpServletRequest mpRequest) throws Exception, IOException {
		System.out.println("--펀딩오픈 신청하기");
		//System.out.println("allvo: " + allvo);
		
		//파일업로드->디비에 저장
		MultipartFile file = mpRequest.getFile("pimg_no");
		
		if(file.getOriginalFilename() != "" ) {
			System.out.println("file not null");
			String fileName = file.getOriginalFilename();
			file.transferTo(new File("C:\\MyStudy\\temp\\"+fileName));
			allvo.setFileName(fileName);
		}
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
	public String updateBoard(FundingOpenVO ovo, FundingRewardVO rvo) {
		System.out.println("--게시글 수정");
		fundingService.updateBoard(ovo, rvo);
		return "fundingList.jsp";
	}

	@RequestMapping("/fundingEnter.do")
	public String totalSum(HttpServletRequest request, ModelMap model) {
		String totalSum = request.getParameter("totalSum");
		model.addAttribute("totalSum", totalSum);
		
		List<String> list = new ArrayList<>();
		
		//펀딩 오픈할 때 리워드 10개 이하로만 입력해야 함,,
		for(int i=0; i<10; i++) {
			if(request.getParameter("list"+i) != null) {
				list.add(request.getParameter("list"+i));
			}
		}
		model.addAttribute("list", list);
		return "fundingEnter.jsp";
	}

	@RequestMapping("/fundingPayment.do")
	public String insertPay(FundingAllVO allvo, Model model) {
		System.out.println("---회원)펀딩 참여");
		//System.out.println("allvo: " + allvo);
		fundingService.insertPay(allvo);
		
		//결제 내역 리스트
		List<FundingPayVO> pays = fundingService.getPayList(allvo.getId());
		model.addAttribute("pays", pays); //System.out.println("pays: " + pays);
		return "allPayList.jsp";

	}
	
	@RequestMapping("/allPayList.do") 
	public String getPayList(FundingPayVO pvo, HttpSession session, Model model) { 
		System.out.println("---펀딩 참여 전체 리스트");
		String id = (String)session.getAttribute("id");
		System.out.println("id: "+id);
		
		List<FundingPayVO> pays = fundingService.getPayList(id);
		model.addAttribute("pays", pays);
		//System.out.println("pays: " + pays); 
		return "allPayList.jsp"; 
	}
	 
}
