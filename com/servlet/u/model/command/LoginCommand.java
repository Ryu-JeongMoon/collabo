package u.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import u.model.MemberDAO;
import u.model.MemberVO;

public class LoginCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터값 vo에 저장 id값 받아옴
		MemberDAO dao = new MemberDAO();	
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		MemberVO vvo = dao.login(vo);
		
		if(vvo != null) {	//성공
			HttpSession session = request.getSession();
			session.setAttribute("login",vvo);
			return "header.jsp";
		}else {
			return"loginfail.jsp";
		}
		
		
		
		
	}
}