package com.zipbop.funding.repository;

import com.zipbop.funding.domain.*;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FundingDAOMybatis {

    private final SqlSessionTemplate mybatis;

/*
    // 아이디
    public String getMember(String id) {
        return mybatis.selectOne("FundingDAO.getMember", id);
    }

    // 사업자 번호
    public MemberVO getLicense(MemberVO mvo) {
        return mybatis.selectOne("FundingDAO.getLicense", mvo);
    }
*/

    // 상세조회(selectOne)
    public FundingAllVO getBoard(int product_no) {
        return mybatis.selectOne("FundingDAO.getBoard", product_no);
    }

    // 펀딩오픈 신청(insert)
    public void insertBoard(FundingAllVO allvo) {
        mybatis.insert("FundingDAO.insertBoard", allvo);
        mybatis.insert("FundingDAO.insertRewardList", allvo);
    }

    // 펀딩글 삭제(delete)
    public void deleteBoard(int product_no) {
        mybatis.delete("FundingDAO.deleteBoard", product_no);
    }

    // 결제 리스트(selectList)
    public List<FundingPayVO> getPayList(String id) {
        return mybatis.selectList("FundingDAO.getPayList", id);
    }

    // 리워드 이름 가져오기
    public String getRewardName(int product_no) {
        return mybatis.selectOne("FundingDAO.getRewardName", product_no);
    }

    // 리워드 가격 가져오기
    public String getRewardPrice(int product_no) {
        return mybatis.selectOne("FundingDAO.getRewardPrice", product_no);
    }

    // 펀딩글 수정(update)
    public void updateBoard(FundingOpenVO ovo, FundingRewardVO rvo) {
        mybatis.update("FundingDAO.updateBoard", ovo); // open폼 수젇
        mybatis.update("FundingDAO.updateReward", rvo); // reward 수정
    }

    // 회원이 펀딩 참여 (insert)
    public void insertPay(FundingAllVO allvo) {
        mybatis.insert("FundingDAO.insertPay", allvo); // 펀딩 참여
        mybatis.update("FundingDAO.updateSS", allvo); // 참여 시 후원자 수, 모금액 변화
    }

    // 전체 펀딩 수
    public int getTotalFundingCount() {
        return mybatis.selectOne("FundingDAO.getTotalFundingCount");
    }

    public int getOngoingFundingCount() {
        return mybatis.selectOne("FundingDAO.getOngoingFundingCount");
    }

    public int getSuccessfulFundingCount() {
        return mybatis.selectOne("FundingDAO.getSuccessfulFundingCount");
    }

    public int getFailureFundingCount() {
        return mybatis.selectOne("FundingDAO.getFailureFundingCount");
    }
}
