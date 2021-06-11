package com.bc.calendar.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.calendar.model.DAO;
import com.bc.calendar.model.vo.CalendarVO;


@WebServlet("/getEvent")
public class GetEventController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		//System.out.println("controller intro");

		//String id = request.getParameter("id");
		//String pwd = request.getParameter("pwd");
		//System.out.println("id : " + id + ", pwd : " + pwd);
		
		//DB 연동해서 회원여부 확인 후 필요데이터 가져오기
		
		//1. 파라미터 값 확인(추출)
		//String fullname = req.getParameter("fullname");
		
		//오늘 달 가져오기
		/*
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH) + 1;
		String month;
		if(mon < 10) {
			month = "0" + mon;
		} else {
			month = Integer.toString(mon);
		}
		
		System.out.println(year);
		System.out.println(month);
		String yearMonth = year + "/" + month;
		*/
		//2. DB에서 데이터 가져오기
		List<CalendarVO> list = DAO.getEvent();
		//{"id":"hong", "name":"홍길동"}
		//3. DB 데이터 request scope에 저장
		//request.setAttribute("list", list);
		
		//4.fullnameList.jsp 페이지로 위임(전가) 처리
		//request.getRequestDispatcher("calendar.jsp").forward(request, response);
		
		PrintWriter out = response.getWriter();
		//{"id":"hong", "name":"홍길동"}
		//{"id":"hong", "name":"홍길동", "age":27}
		List<String> eventArray = new ArrayList<String>();
		for(CalendarVO vo : list) {
			String output = "{";
			output += "\"title\" : \"" + vo.getTitle() + "\", ";
			String end_date;
			int end = Integer.parseInt(vo.getEnd_date().substring(8,10));
			end++;
			if(end < 10) { end_date = "0" + end; }
			else { end_date = Integer.toString(end); }
			output += "\"start\" : \"" + vo.getStart_date().substring(0, 10) + "\", ";
			output += "\"end\" : \"" + vo.getEnd_date().substring(0, 8) + end_date + "\", ";
			output += "\"id\" : \"" + vo.getId() + "\" ";
			
			output += "}";
			eventArray.add(output);
		}
		
		out.print(eventArray);
		System.out.println(eventArray);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
