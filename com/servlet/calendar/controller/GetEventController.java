package com.bc.calendar.controller;

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
import com.bc.calendar.util.Util;


@WebServlet("/getEvent")
public class GetEventController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		List<CalendarVO> list = DAO.getEvent();
		
		PrintWriter out = response.getWriter();
		
		List<String> eventArray = new ArrayList<String>();
		for(CalendarVO vo : list) {
			String output = "{";
			output += "\"title\" : \"" + vo.getTitle() + "\", ";
			String end_date = Util.plusDate(vo.getEnd_date());
			
			output += "\"start\" : \"" + vo.getStart_date().substring(0, 10) + "\", ";
			output += "\"end\" : \"" + vo.getEnd_date().substring(0, 8) + end_date + "\", ";
			output += "\"color\" : \"" + vo.getColor() + "\", ";
			output += "\"textColor\" : \"" + vo.getText_color() + "\", ";
			output += "\"id\" : \"" + vo.getId() + "\" ";
			
			output += "}";
			eventArray.add(output);
		}
		
		out.print(eventArray);
		
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
