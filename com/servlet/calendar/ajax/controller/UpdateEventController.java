package com.bc.calendar.ajax.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.calendar.model.DAO;

@WebServlet("/updateEventFast")
public class UpdateEventController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String title = request.getParameter("title");
		String id = request.getParameter("id");

		DAO.updateEventFast(title, start_date, end_date, id);
		
		
		//PrintWriter out = response.getWriter();
		//out.print(output);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
