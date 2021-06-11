package com.bc.calendar.ajax.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.calendar.model.DAO;

@WebServlet("/addEventFast")
public class AddEventController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String start_date = request.getParameter("start_date");
		String end = request.getParameter("end_date");
		String end_date = end.substring(7);
		System.out.println(start_date);
		
		DAO.addEventFast(start_date, end_date);
		
		
		//PrintWriter out = response.getWriter();
		//out.print(output);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
