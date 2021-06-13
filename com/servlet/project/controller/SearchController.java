package bitcamp.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.project.model.DAO;
import bitcamp.project.mybatis.DBService;
import bitcamp.project.vo.PjNoticeVO;
//검색컨트롤러
@WebServlet("/pj_notice/search")
public class SearchController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//작성자, 내용, 제목으로 분류하여 원하는 조건에서 검색할 수 있도록 함.
		//파라미터 값 추출
		String c_field = request.getParameter("f");  //선택한 검색분류
		String c_query = request.getParameter("q");	//입력한 검색어
		
		String field = "writer";  //검색목록-작성자
		if(c_field != null && !c_field.equals("")) {
			field = c_field;
		}
		String query = "";
		if(c_query != null && !c_query.equals("")) {
			query = c_query;
		}
		
		List<PjNoticeVO> list = DAO.getListWithKeyword(field, query);
		request.setAttribute("list", list);

		request.getRequestDispatcher("/pj_notice/search.jsp").forward(request, response);	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}
}
