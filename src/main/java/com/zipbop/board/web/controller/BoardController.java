package com.zipbop.board.web.controller;

import com.zipbop.board.domain.entity.*;
import com.zipbop.board.domain.paging.Criteria;
import com.zipbop.board.domain.paging.PageMarker;
import com.zipbop.board.domain.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 50,
                 maxRequestSize = 1024 * 1024 * 50 * 5)
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/index")
    public String index() {
        return "board/index";
    }

    @RequestMapping("/getFundingList")
    public String getFundingList(Criteria cri, Model model) {

        List<FundingVO> boardList = boardService.getFundingBoardList(cri);

        for (FundingVO fundingVO : boardList)
            fundingVO.data();

        PageMarker pageMaker = new PageMarker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.fundingListCount(cri));

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageMaker", pageMaker);
        return "board/getFundingList";
    }

    //구매 게시판
    @RequestMapping("/getPurchaseList")
    public String getPurchaseList(Criteria cri, Model model) {

        List<PurchaseVO> boardList = boardService.getPurchaseBoardList(cri);

        PageMarker pageMaker = new PageMarker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.purchaseListCount(cri));

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageMaker", pageMaker);
        return "board/getPurchaseList";
    }

    @GetMapping("/getImg")
    public void setImageFileById(HttpServletResponse response, HttpServletRequest request) throws IOException {

        StringBuilder sb = new StringBuilder("file:/Users/ryujeongmoon/Downloads/upload/");
        String no = request.getParameter("no");
        sb.append(no);
        URL fileUrl = new URL(sb.toString());
        IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
    }

    @GetMapping("/getpImg")
    public void setImageFileByUrl(HttpServletResponse response, HttpServletRequest request) throws IOException {

        StringBuilder sb = new StringBuilder("file:/Users/ryujeongmoon/Downloads/upload/");
        String url = request.getParameter("url");
        sb.append(url);
        URL fileUrl = new URL(sb.toString());
        IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
    }

    @ResponseBody
    @GetMapping("/updateHit")
    public void updateHit(BoardVO vo) {
        boardService.updateHit(vo);
    }

    @ResponseBody
    @PostMapping("/insertAnswer")
    public AnswerVO insertAnswer(BoardVO vo, AnswerVO answer) {
        boardService.insertAnswer(vo, answer);
        return boardService.selectAnswer(vo);
    }

    @ResponseBody
    @PostMapping("/updateAnswer")
    public void updateAnswer(BoardVO vo, AnswerVO answer) {
        boardService.updateAnswer(vo, answer);
    }

    @ResponseBody
    @PostMapping("/deleteAnswer")
    public void deleteAnswer(BoardVO vo) {
        boardService.deleteAnswer(vo.getNo());
    }

    @RequestMapping("/getBoardList")
    public String getBoardListView(BoardVO vo, Criteria cri, Model model) {

        List<BoardVO> boardList = boardService.getBoardList(cri);
        log.info("vo = {}", vo);

        model.addAttribute("boardList", boardList);

        PageMarker pageMaker = new PageMarker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.listCount(cri));

        model.addAttribute("pageMaker", pageMaker);
        List<AnswerVO> answer = boardService.selectAnswerAll();
        model.addAttribute("answerList", answer);

        if (cri.getFlag_nq().equals("N")) {
            return "board/getNoticeList";
        } else {
            return "board/getQnaList";
        }
    }

    @GetMapping("/getBoard")
    public String getBoardView(@RequestParam("flag_nq") char flag_nq, BoardVO vo, Model model, String cnt) {

        if (cnt != null)
            updateHit(vo);

        BoardVO board = boardService.getBoard(vo);
        List<FileVO> file = boardService.selectFile(vo);
        AnswerVO answer = boardService.selectAnswer(vo);

        model.addAttribute("file", file);
        model.addAttribute("board", board);
        model.addAttribute("answer", answer);

        return "board/getBoard";
    }

    @GetMapping("/fileDownload")
    public void fileDownload(FileVO file, HttpServletResponse response) throws Exception {

        file = boardService.downloadFile(file);

        String storedFileName = file.getStored_file_name();
        String originalFileName = file.getOrg_file_name();
        byte fileByte[] = FileUtils.readFileToByteArray(new File("/Users/ryujeongmoon/Downloads/upload/" + storedFileName));

        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }

    @GetMapping("/insertBoard")
    public String insertBoardView(
            @RequestParam("flag_nq") String flag_nq, Model model) {
        model.addAttribute("flag", flag_nq);
        return "board/insertBoard";
    }

    @PostMapping("/insertBoard")
    public String insertBoard(
            @RequestParam("flag_nq") char flag_nq,
            @ModelAttribute("vo") BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {

        vo.setNo(boardService.getNo());
        boardService.insertFile(vo, mpRequest);
        boardService.insertBoard(vo);
        return "redirect:/board/getBoardList?flag_nq=" + flag_nq;
    }

    @GetMapping("/updateBoard")
    public String updateQnaView(BoardVO vo, Model model) {
        BoardVO board = boardService.getBoard(vo);
        model.addAttribute("board", board);

        List<FileVO> fileList = boardService.selectFile(vo);
        model.addAttribute("file", fileList);
        return "board/updateBoard";
    }

    @PostMapping("/updateBoard")
    public String updateQna(
//            @RequestParam("flag_nq") char flag_nq,
            @ModelAttribute("board") BoardVO vo, MultipartHttpServletRequest mpRequest,
            @RequestParam(value = "del_file_no") String[] files) throws Exception {

        for (String no : files)
            boardService.deleteFile(no);

        if (mpRequest != null)
            boardService.insertFile(vo, mpRequest);

        boardService.updateBoard(vo);

        return "redirect:/board/getBoard?no=" + vo.getNo();
    }

    @GetMapping("/deleteBoard")
    public String deleteQna(BoardVO vo) {

        boardService.deleteBoard(vo);
        return "redirect:/board/getBoardList";
    }
}
