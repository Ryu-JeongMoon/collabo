package hello.servlet.bit.controller.pojo;

import hello.servlet.bit.controller.BoardController;
import java.util.Map;


public class BoardWriteController implements BoardController {

    @Override
    public String process(Map<String, String> paramMap, Map<String, Object> model) {
        return "write";
    }
}
