package com.zipbop.funding.service;

import com.zipbop.funding.domain.*;

import java.util.List;

public interface FundingService {
	
	FundingAllVO getBoard(int product_no);
	void insertBoard(FundingAllVO allvo);
	void deleteBoard(int product_no);
	void updateBoard(FundingOpenVO ovo, FundingRewardVO rvo);
	String getRewardName(int product_no);
	String getRewardPrice(int product_no);
	void insertPay(FundingAllVO allvo);
	List<FundingPayVO> getPayList (String id);
	//String getPayChk(int pay_no);
}
