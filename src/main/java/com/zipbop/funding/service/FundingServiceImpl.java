package com.zipbop.funding.service;

import com.zipbop.funding.domain.*;
import com.zipbop.funding.repository.FundingDAOMybatis;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FundingServiceImpl implements FundingService {

	private final FundingDAOMybatis fundingDAO;
	
	@Override
	public FundingAllVO getBoard(int product_no) {
		return fundingDAO.getBoard(product_no);
	}

	@Override
	public void insertBoard(FundingAllVO allvo) {
		fundingDAO.insertBoard(allvo);
	}

	@Override
	public void deleteBoard(int product_no) {
		fundingDAO.deleteBoard(product_no);
	}

	@Override
	public List<FundingPayVO> getPayList(String id) {
		return fundingDAO.getPayList(id);
	}

//	@Override
//	public String getPayChk(int pay_no) {
//		return fundingDAO.getPayChk(pay_no);
//	}

	@Override
	public void updateBoard(FundingOpenVO ovo, FundingRewardVO rvo) {
		fundingDAO.updateBoard(ovo, rvo);
	}

	@Override
	public String getRewardName(int product_no) {
		return fundingDAO.getRewardName(product_no);
	}
	
	@Override
	public String getRewardPrice(int product_no) {
		return fundingDAO.getRewardPrice(product_no);
	}

	@Override
	public void insertPay(FundingAllVO allvo) {
		fundingDAO.insertPay(allvo);
	}
}
