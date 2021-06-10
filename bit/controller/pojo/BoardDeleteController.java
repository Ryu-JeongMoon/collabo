package hello.servlet.bit.controller.pojo;

import hello.servlet.bit.controller.BoardController;
import hello.servlet.bit.domain.DataBoardDAO;
import hello.servlet.bit.domain.DataBoardVOView;

import java.util.List;
import java.util.Map;

public class BoardDeleteController implements BoardController {

    private DataBoardDAO dataBoardDAO = DataBoardDAO.getInstance();

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {

        long post_no = Long.parseLong(paramMap.get("post_no"));
        dataBoardDAO.deletePost(post_no);

        List<DataBoardVOView> list = dataBoardDAO.getList();
        model.put("list", list);
        return "redirect:http://localhost:8080/data-board/list";
    }
}
