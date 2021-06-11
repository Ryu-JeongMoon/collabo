package com.bc.calendar.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.calendar.model.vo.CalendarVO;
import com.bc.calendar.mybatis.DBService;

public class DAO {
	
	//일정 조회
	public static List<CalendarVO> getEvent() {
		//SqlSession ss = DBService.getFactory().openSession();
		SqlSession ss = DBService.getFactory().openSession();
		List<CalendarVO> list = ss.selectList("bitcamp.allEvent");
		ss.close();
		System.out.println("IN DAO");
		//System.out.println(list);
		return list;
		
	}
	
	//일정 수정
	public static void updateEventFast(String title, String start_date, String end_date, String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		HashMap<String, String> hsMap = new HashMap<String, String>();
		hsMap.put("start_date", start_date);
		hsMap.put("end_date", end_date);
		hsMap.put("title", title);
		hsMap.put("id", id);
		ss.update("bitcamp.updateEventFast", hsMap);
		ss.close();
	}
	
	//일정 추가
	public static void addEventFast(String start_date, String end_date) {
		SqlSession ss = DBService.getFactory().openSession(true);
		HashMap<String, String> hsMap = new HashMap<String, String>();
		hsMap.put("start_date", start_date);
		hsMap.put("end_date", end_date);
		
		System.out.println(hsMap);
		
		ss.insert("bitcamp.addEventFast", hsMap);
		ss.close();
		
	}
}
