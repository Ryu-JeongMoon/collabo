package com.zipbop.funding;

import java.util.List;

public interface FundingService {
	
	FundingAllVO getBoard(FundingAllVO allvo);
	void insertBoard(FundingAllVO allvo);
	void deleteBoard(FundingOpenVO ovo);
	void updateBoard(FundingOpenVO ovo, FundingRewardVO rvo);
	String getRewardName(int product_no);
	String getRewardPrice(int product_no);
	void insertPay(FundingAllVO allvo);
	String getMember(String id);
	List<FundingPayVO> getPayList (String id);
}
