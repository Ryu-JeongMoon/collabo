package com.spring.board.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAOMybatis() {
		System.out.println(">> BoardDAOMybatis() 객체생성");
	}
			
	//로그인
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
		System.out.println("no : " + no);
		mybatis.delete("Board.deleteAnswer", no);
	}

	public List<AnswerVO> selectAnswerAll() {
		return mybatis.selectList("Board.selectAnswerAll");
	}
	
	//글입력
	public void insertFile(Map<String, Object> map) throws Exception {
		System.out.println("===> mybatis로 insertBoard() 실행");
		
		
		mybatis.insert("Board.insertFile", map);
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> mybatis로 insertBoard() 실행");
		mybatis.insert("Board.insertBoard", vo);
	}
	
	//글수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> mybatis로 updateBoard() 실행");
		mybatis.update("Board.updateBoard", vo);
	}
			
	//글삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> mybatis로 deleteBoard() 실행");
		mybatis.delete("Board.deleteBoard", vo);
		mybatis.update("Board.deleteFileAll", vo);
	}
			
	//글상세조회(데이터 하나 조회)
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> mybatis로 getBoard() 실행");
		System.out.println("DAO vo : " + vo);
		return mybatis.selectOne("Board.getBoard", vo);

	}
	
	public List<BoardVO> getBoardList(Criteria cri){
		return mybatis.selectList("Board.getBoardList",cri);
	}
	
	public List<FileVO> selectFile(BoardVO vo) {
		//System.out.println("dao : " + mybatis.selectList("Board.selectFile", vo));
		return mybatis.selectList("Board.selectFile", vo);
	}
	
	public FileVO downloadFile(FileVO vo) {
		//System.out.println("dao : " + mybatis.selectList("Board.selectFile", vo));
		return mybatis.selectOne("Board.downloadFile", vo);
	}
	
	public void updateFile(Map<String, Object> map) throws Exception {
		
		mybatis.update("Board.updateFile", map);
	}
	
	public void deleteFile(String no) {
		mybatis.update("Board.deleteFile", no);
	}
	
	public String getNo() {
		System.out.println("DAO getNO : " + mybatis.selectOne("Board.getNo"));
		return mybatis.selectOne("Board.getNo");
	}
	
	public List<String> getFlag() {
		return mybatis.selectList("Board.getFlag");
	}
	
	public int listCount(Criteria cri) {
		return mybatis.selectOne("Board.listCount", cri);
	}
	
	public void updateHit(BoardVO vo) {
		System.out.println("HIT 계산");
		mybatis.update("Board.updateHit", vo);
	}
	
	//펀딩 게시판 리스트
	   public List<FundingVO> getFundingBoardList(Criteria cri){
	      return mybatis.selectList("Board.getFundingBoardList",cri);
	   }
	   //펀딩게시판 페이징
	   public int FundinglistCount(Criteria cri) {
	      return mybatis.selectOne("Board.FundinglistCount",cri);
	   }
	   
	   //구매 게시판 리스트
	   public List<PerchaseVO> getPerchaseBoardList(Criteria cri){
	      return mybatis.selectList("Board.getPerchaseBoardList",cri);
	   }
	   
	   //구매 게시판 페이징
	   public int PerchaseListCount(Criteria cri) {
	      return mybatis.selectOne("Board.PerchaselistCount",cri);
	   }
}
