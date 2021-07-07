package com.zipbop.funding.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zipbop.funding.FundingAllVO;
import com.zipbop.funding.FundingOpenVO;
import com.zipbop.funding.FundingPayVO;
import com.zipbop.funding.FundingRewardVO;

@Repository
public class FundingDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public FundingDAOMybatis() {
		System.out.println("---FundingDAOMybatis() 객체 생성");
	}

	// 아이디
	public String getMember(String id) {
		System.out.println("-----getMember(id) 실행");
		return mybatis.selectOne("FundingDAO.getMember", id);
	}

	// 상세조회(selectOne)
	public FundingAllVO getBoard(FundingAllVO allvo) {
		System.out.println("-----getBoard(allvo) 실행");
		return mybatis.selectOne("FundingDAO.getBoard", allvo);
	}

	// 펀딩오픈 신청(insert)
	public void insertBoard(FundingAllVO allvo) {
		System.out.println("-----insertBoard(allvo) 실행");
		mybatis.insert("FundingDAO.insertBoard", allvo);
		// mybatis.insert("FundingDAO.insertFundingList", allvo);
		mybatis.insert("FundingDAO.insertRewardList", allvo);
		System.out.println("DAO-allvo.getReward_no(): " + allvo.getReward_no());
	}

	// 펀딩글 삭제(delete)
	public void deleteBoard(FundingOpenVO ovo) {
		System.out.println("-----deleteBoard(ovo) 실행");
		mybatis.delete("FundingDAO.deleteBoard", ovo);
	}

	// 결제 리스트(selectList)	
	public List<FundingPayVO> getPayList(String id) {
	System.out.println("-------getPayList(String id) 실행"); 
	return mybatis.selectList("FundingDAO.getPayList",id); 
	}
	
	// 리워드 이름 가져오기
	public String getRewardName(int product_no) {
		System.out.println("getRewardName 실행");
		return mybatis.selectOne("FundingDAO.getRewardName", product_no);
	}

	// 리워드 가격 가져오기
	public String getRewardPrice(int product_no) {
		System.out.println("getRewardPrice 실행");
		return mybatis.selectOne("FundingDAO.getRewardPrice", product_no);
	}

	// 펀딩글 수정(update)
	public void updateBoard(FundingOpenVO ovo, FundingRewardVO rvo) {
		System.out.println("-----updateBoard(ovo, rvo) 실행");
		mybatis.update("FundingDAO.updateBoard", ovo); // open폼 수젇
		mybatis.update("FundingDAO.updateReward", rvo); // reward 수정
	}

	// 회원이 펀딩 참여 (insert)
	public void insertPay(FundingAllVO allvo) {
		System.out.println("---insertPay(allvo) 실행");
		mybatis.insert("FundingDAO.insertPay", allvo); // 펀딩 참여
		mybatis.update("FundingDAO.updateSS", allvo); // 참여 시 후원자 수, 모금액 변화
	}

}
