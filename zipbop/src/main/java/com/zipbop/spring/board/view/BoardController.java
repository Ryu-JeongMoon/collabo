package com.spring.board.view;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.biz.FileVO;
import com.spring.board.biz.FundingVO;
import com.spring.board.biz.PageMarker;
import com.spring.board.biz.PerchaseVO;
import com.spring.board.biz.AnswerVO;
import com.spring.board.biz.BoardService;
import com.spring.board.biz.BoardVO;
import com.spring.board.biz.Criteria;


@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	//펀딩 게시판
	   @RequestMapping("/getFundingList.do")
	   public String getFundingList(Criteria cri, Model model ) {
	      List<FundingVO> boardList = boardService.getFundingBoardList(cri);
	      for(FundingVO fundingVO : boardList) {
	         fundingVO.Data();
	         
	      }
	      
	      model.addAttribute("boardList", boardList);
	      
	      PageMarker pageMaker = new PageMarker();
	      pageMaker.setCri(cri);
	      pageMaker.setTotalCount(boardService.FundinglistCount(cri));
	      
	      
	      model.addAttribute("pageMaker",pageMaker);
	      return "getFundingList.jsp";
	      
	   }
	   
	   //구매 게시판
	   @RequestMapping("/getPerchaseList.do")
	   public String getPerchaseList(Criteria cri, Model model ) {
	      List<PerchaseVO> boardList = boardService.getPerchaseBoardList(cri);
	      
	      model.addAttribute("boardList", boardList);
	      
	      PageMarker pageMaker = new PageMarker();
	      pageMaker.setCri(cri);
	      pageMaker.setTotalCount(boardService.PerchaseListCount(cri));
	      
	      
	      model.addAttribute("pageMaker",pageMaker);
	      return "getPerchaseList.jsp";
	      
	   }
	   
	   @GetMapping("getImg.do")
	    public void setImageFileById(HttpServletResponse response,HttpServletRequest request)
	            throws IOException {
	        StringBuilder sb = new StringBuilder("file:///C:\\MyStudy\\temp\\");
	        String no = request.getParameter("no");
	        sb.append(no);
	        
	        URL fileUrl = new URL(sb.toString());
	        
	        IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
	 
	    }
	   
	   @GetMapping("getpImg.do")
	   public void setImageFileByUrl(HttpServletResponse response,HttpServletRequest request)
	         throws IOException {
	      StringBuilder sb = new StringBuilder("file:///C:\\MyStudy\\temp\\");
	      String url = request.getParameter("url");
	      sb.append(url);

	      URL fileUrl = new URL(sb.toString());

	      IOUtils.copy(fileUrl.openStream(), response.getOutputStream());

	   }
	
	
	@PostMapping("/notice.do")
	public void detailNotice () {
		
	}
	
	@PostMapping("login.do")
	public String login(String id) {
		String member = boardService.getMember(id);
		if(member != null) {
			return "index.jsp";			
		} else {
			return "login.jsp";
		}
		
	}
	
	@ResponseBody
	@GetMapping("/updateHit.do")
	public void updateHit(BoardVO vo) {
		boardService.updateHit(vo);
	}
	
	@ResponseBody
	@PostMapping("/insertAnswer.do")
	public AnswerVO insertAnswer(BoardVO vo, AnswerVO answer) {
		
		boardService.insertAnswer(vo, answer);
		
		return boardService.selectAnswer(vo);
	}
	
	@ResponseBody
	@PostMapping("/updateAnswer.do")
	public void updateAnswer(BoardVO vo, AnswerVO answer) {
		boardService.updateAnswer(vo, answer);
	}
	
	@ResponseBody
	@PostMapping("/deleteAnswer.do")
	public void deleteAnswer(BoardVO vo) {
		boardService.deleteAnswer(vo.getNo());
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardListView(BoardVO vo, Criteria cri, Model model ) {
		
		List<BoardVO> boardList = boardService.getBoardList(cri);
		
		model.addAttribute("boardList", boardList);
		
		PageMarker pageMaker = new PageMarker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.listCount(cri));
		
		
		model.addAttribute("pageMaker",pageMaker);
		
		List<AnswerVO> answer = boardService.selectAnswerAll();
		model.addAttribute("answerList", answer);
		
		
		if(cri.getFlag_nq().equals("N")) {
			return "getNoticeList.jsp";			
		} else {	
			return "getQnaList.jsp";
		}
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoardView(BoardVO vo, String cnt, Model model) {
		if(cnt != null) {
			updateHit(vo);
		}
		
		BoardVO board = boardService.getBoard(vo);
		model.addAttribute("board", board);
		
		List<FileVO> file = boardService.selectFile(vo);
		model.addAttribute("file", file);
		
		AnswerVO answer = boardService.selectAnswer(vo);
		model.addAttribute("answer", answer);
		
		return "getBoard.jsp";

	}
	
	@GetMapping("/fileDownload.do")
	public void fileDownload(FileVO file, HttpServletResponse response) throws Exception{
		file = boardService.downloadFile(file);
		String storedFileName = file.getStored_file_name();
		String originalFileName = file.getOrg_file_name();

		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\MyStudy\\upload\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	@PostMapping("/insertBoard.do")
	public String insertBoard (BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		vo.setNo(boardService.getNo());

		boardService.insertFile(vo, mpRequest);	
		boardService.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	@GetMapping("/insertBoard.do")
	public String insertBoardView (BoardVO vo, Model model) {
		model.addAttribute("flag", vo.getFlag_nq());
		
		return "insertBoard.jsp";
	}

	@GetMapping("/updateBoard.do")
	public String updateQnaView(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo);
		model.addAttribute("board", board);
		
		List<FileVO> fileList = boardService.selectFile(vo);
		model.addAttribute("file", fileList);
		return "updateBoard.jsp";
	}
	
	@PostMapping("/updateBoard.do")
	public String updateQna(@ModelAttribute("board") BoardVO vo,MultipartHttpServletRequest mpRequest, @RequestParam(value="del_file_no") String[] files) throws Exception {
		
		for(String no : files) {
			boardService.deleteFile(no);
		}
		
		if(mpRequest != null) {
			boardService.insertFile(vo, mpRequest);
					
		}
		
		boardService.updateBoard(vo);
		
		return "getBoard.do";
	}
	
	
	@GetMapping("/deleteBoard.do")
	public String deleteQna(BoardVO vo, Model model) {
		boardService.deleteBoard(vo);

		return "getBoardList.do";
	}
	
	
	
}