package hello.servlet.bit.controller.pojo;

import hello.servlet.bit.controller.BoardController;
import hello.servlet.bit.domain.DataBoardDAO;
import hello.servlet.bit.domain.DataBoardVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig(
        fileSizeThreshold = 1024*1024,
        maxFileSize = 1024*1024*50,
        maxRequestSize = 1024*1024*50*5
)
public class BoardUpdateController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        long post_no = Long.parseLong(paramMap.get("post_no"));
        DataBoardVO listByNo = dataBoardDAO.getListByNo(post_no);

        if(paramMap.get("p") != null) {
            model.put("p", paramMap.get("p"));
            model.put("f", paramMap.get("f"));
            model.put("k", paramMap.get("k"));
        }

        model.put("list", listByNo);
        return "update";
    }
}
