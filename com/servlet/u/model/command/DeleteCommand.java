package u.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import u.model.MemberDAO;
import u.model.MemberVO;

public class DeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");

		System.out.println("가져온 아이디" + id);
		
		dao.deletemember(id);
		System.out.println("회원탈퇴 눌렀을때"+id);
		
		
		session.removeAttribute("id");
		session.invalidate();
		
		return "deleteok.jsp";
	}

	
}