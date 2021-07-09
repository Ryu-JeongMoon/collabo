package com.zipbop.board.domain.service;

import com.zipbop.board.domain.entity.*;
import com.zipbop.board.domain.paging.Criteria;
import com.zipbop.board.domain.repository.BoardDAOMybatis;
import com.zipbop.board.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@Service
public class BoardService {

    private final BoardDAOMybatis boardDAO;

    @ModelAttribute("conditionMap")
    public Map<String, String> searchConditionMap() {
        Map<String, String> conditionMap = new HashMap<>();
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
        boardDAO.insertBoard(vo);
    }

    public void insertFile(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {

        List<MultipartFile> mpList = mpRequest.getFiles("file");

        for (MultipartFile file : mpList) {
            if (!file.isEmpty()) {
                log.info("fileName = {}", file.getOriginalFilename());
                Map<String, Object> list = FileUtils.parseInsertFileInfo(vo, file);
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

    public List<BoardVO> getBoardList(Criteria cri) {
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

    public List<FundingVO> getFundingBoardList(Criteria cri) {
        return boardDAO.getFundingBoardList(cri);
    }

    public int fundingListCount(Criteria cri) {
        return boardDAO.fundingListCount(cri);
    }

    public List<PurchaseVO> getPurchaseBoardList(Criteria cri) {
        return boardDAO.getPurchaseBoardList(cri);
    }

    public int purchaseListCount(Criteria cri) {
        return boardDAO.purchaseListCount(cri);
    }
}
