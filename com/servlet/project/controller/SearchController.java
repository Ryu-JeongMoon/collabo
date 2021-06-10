package bitcamp.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.project.model.DAO;
import bitcamp.project.vo.PjNoticeVO;
//검색컨트롤러
@WebServlet("/search")
public class SearchController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//파라미터 값 추출
		String c_field = request.getParameter("f");  //선택한 검색목록 key값
		String c_query = request.getParameter("q");	//입력한 검색어 value값
		
		String field = "writer";  //검색목록-작성자
		if(c_field != null && c_field.equals("")) {
			c_field = field;
		}
		String query = "";
		if(c_query != null && c_query.equals("")) {
			c_query = query;
		}
	
		request.getRequestDispatcher("pj_notice/search.jsp").forward(request, response);		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}
}
