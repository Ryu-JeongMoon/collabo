package com.zipbop.funding.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zipbop.funding.FundingAllVO;
import com.zipbop.funding.FundingOpenVO;
import com.zipbop.funding.FundingPayVO;
import com.zipbop.funding.FundingRewardVO;
import com.zipbop.funding.FundingService;

@Service("fundingService")
public class FundingServiceImpl implements FundingService {

	@Autowired
	private FundingDAOMybatis fundingDAO;
	
	public FundingServiceImpl() {
		System.out.println("----FundingServiceImpl() 객체 생성");
	}
	
	@Override
	public FundingAllVO getBoard(FundingAllVO allvo) {
		System.out.println("allvo: "+allvo);
		return fundingDAO.getBoard(allvo);
	}

	@Override
	public void insertBoard(FundingAllVO allvo) {
		fundingDAO.insertBoard(allvo);
	}

	@Override
	public void deleteBoard(FundingOpenVO ovo) {
		fundingDAO.deleteBoard(ovo);
	}

/*	@Override
	public List<FundingRewardVO> getRewardList(int product_no) {
		return fundingDAO.getRewardList(product_no);
	}
*/
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

	/*
	 * @Override public List<FundingPayVO> getSupporterList(int product_no) { return
	 * fundingDAO.getSupporterList(product_no); }
	 */

/*	@Override
	public void updateReward(FundingRewardVO rvo) {
		fundingDAO.updateReward(rvo);	
	}
*/

}
