package com.spring.board.biz;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.util.FileUtils;


// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직처리 서비스 영역에 사용
@Service("boardService")
public class BoardService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAOSpring boardDAO;
	private BoardDAOMybatis boardDAO;
	
	public BoardService() {
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	public void insertAnswer(BoardVO vo, AnswerVO answer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", vo.getNo());
		map.put("text", answer.getText());
		
		
		boardDAO.insertAnswer(map);
	}
	
	public AnswerVO selectAnswer(BoardVO vo) {
		return boardDAO.selectAnswer(vo);
	}

	public void updateAnswer(BoardVO vo, AnswerVO answer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", vo.getNo());
		map.put("text", answer.getText());
		
		
		boardDAO.updateAnswer(map);
	}
	
	public void deleteAnswer(String no) {
		boardDAO.deleteAnswer(no);
	}
	
	public List<AnswerVO> selectAnswerAll() {
		return boardDAO.selectAnswerAll();
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("DAO insert");
		boardDAO.insertBoard(vo);
	}
	
	public void insertFile(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		System.out.println("DAO insert");
		
		List<MultipartFile> mpList = mpRequest.getFiles("file");
			
			 
				
		for(MultipartFile file : mpList) {
			if(file.getOriginalFilename() != "") {
				System.out.println("SERVICE : " + file.getOriginalFilename());
				Map<String,Object> list = FileUtils.parseInsertFileInfo(vo, file);
				boardDAO.insertFile(list); 	
			}		
		}
		
	}
	
	public void deleteFile(String no) {
		boardDAO.deleteFile(no);
	}
	
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	
	
	
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	
	public List<BoardVO> getBoardList(Criteria cri){
		
		return boardDAO.getBoardList(cri);
		
	}
	
	public String getMember(String id) {
		return boardDAO.getMember(id);
	}
	
	public List<FileVO> selectFile(BoardVO vo) {
		return boardDAO.selectFile(vo);
	}
	
	public FileVO downloadFile(FileVO vo) {
		return boardDAO.downloadFile(vo);
	}
	
	public String getNo() {
		System.out.println("Service getNO() : " + boardDAO.getNo());
		return boardDAO.getNo();
	}
	
	public int listCount(Criteria cri) {
		return boardDAO.listCount(cri);
	}
	
	public List<String> getFlag() {
		return boardDAO.getFlag();
	}
	
	public void updateHit(BoardVO vo) {
		boardDAO.updateHit(vo);
	}
	
	public List<FundingVO> getFundingBoardList(Criteria cri){
	      return boardDAO.getFundingBoardList(cri);
	   }
	   
	   public int FundinglistCount(Criteria cri) {
	      return boardDAO.FundinglistCount(cri);
	   }
	   
	   public List<PerchaseVO> getPerchaseBoardList(Criteria cri){
	      return boardDAO.getPerchaseBoardList(cri);
	   }
	   
	   public int  PerchaseListCount(Criteria cri) {
	      return boardDAO.PerchaseListCount(cri);
	   }
}
