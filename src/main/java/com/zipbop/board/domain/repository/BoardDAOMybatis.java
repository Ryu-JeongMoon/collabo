package com.zipbop.board.domain.repository;

import com.zipbop.board.domain.entity.*;
import com.zipbop.board.domain.paging.Criteria;
import com.zipbop.board.domain.paging.PageMarker;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class BoardDAOMybatis {

    private final SqlSessionTemplate mybatis;

    public String getMember(String id) {
        return mybatis.selectOne("Board.getMember", id);
    }

    public void insertAnswer(Map<String, String> map) {
        mybatis.insert("Board.insertAnswer", map);
    }

    public AnswerVO selectAnswer(BoardVO vo) {
        return mybatis.selectOne("Board.selectAnswer", vo);
    }

    public void updateAnswer(Map<String, String> map) {
        mybatis.update("Board.updateAnswer", map);
    }

    public void deleteAnswer(String no) {
        mybatis.delete("Board.deleteAnswer", no);
    }

    public List<AnswerVO> selectAnswerAll() {
        return mybatis.selectList("Board.selectAnswerAll");
    }

    //글입력
    public void insertFile(Map<String, Object> map) throws Exception {
        mybatis.insert("Board.insertFile", map);
    }

    public void insertBoard(BoardVO vo) {
        mybatis.insert("Board.insertBoard", vo);
    }

    //글수정
    public void updateBoard(BoardVO vo) {
        mybatis.update("Board.updateBoard", vo);
    }

    //글삭제
    public void deleteBoard(BoardVO vo) {
        mybatis.delete("Board.deleteBoard", vo);
        mybatis.update("Board.deleteFileAll", vo);
    }

    //글상세조회(데이터 하나 조회)
    public BoardVO getBoard(BoardVO vo) {
        return mybatis.selectOne("Board.getBoard", vo);
    }

    public List<BoardVO> getBoardList(Criteria cri) {
        return mybatis.selectList("Board.getBoardList", cri);
    }

    public List<FileVO> selectFile(BoardVO vo) {
        return mybatis.selectList("Board.selectFile", vo);
    }

    public FileVO downloadFile(FileVO vo) {
        return mybatis.selectOne("Board.downloadFile", vo);
    }

    public void updateFile(Map<String, Object> map) throws Exception {
        mybatis.update("Board.updateFile", map);
    }

    public void deleteFile(String no) {
        mybatis.update("Board.deleteFile", no);
    }

    public String getNo() {
        return mybatis.selectOne("Board.getNo");
    }

    public List<String> getFlag() {
        return mybatis.selectList("Board.getFlag");
    }

    public int listCount(Criteria cri) {
        return mybatis.selectOne("Board.listCount", cri);
    }

    public void updateHit(BoardVO vo) {
        mybatis.update("Board.updateHit", vo);
    }

    public List<FundingVO> getFundingBoardList(Criteria cri) {
        return mybatis.selectList("Board.getFundingBoardList", cri);
    }

    //펀딩게시판 페이징
    public int fundingListCount(Criteria cri) {
        return mybatis.selectOne("Board.fundingListCount", cri);
    }

    //구매 게시판 리스트
    public List<PurchaseVO> getPurchaseBoardList(Criteria cri) {
        return mybatis.selectList("Board.getPurchaseBoardList", cri);
    }

    //구매 게시판 페이징
    public int purchaseListCount(Criteria cri) {
        return mybatis.selectOne("Board.purchaseListCount", cri);
    }
}
