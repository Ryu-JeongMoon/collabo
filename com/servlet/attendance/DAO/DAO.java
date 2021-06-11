package com.bp.attendance.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bp.attendance.mybatis.DBService;
import com.bp.attendance.vo.AttVO;


public class DAO {
	
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("attendance.totalCount");
		ss.close();
		return totalCount;
	}
	
	//게시글 전체 보기 mybatis 버전
	public static List<AttVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AttVO> list = ss.selectList("attendance.list", map);
		ss.close();
		return list;
	}
	
	public static List<AttVO> getList(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<AttVO> list = ss.selectList("attendance.list", map);
		ss.close();
		return list;
	}
	
	//게시글 1개 조회
	public static AttVO selectOne(String a_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		AttVO vo = ss.selectOne("attendance.one", a_idx);
		ss.close();
		return vo;
	}
	
	public static int delete(int a_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		int vo =  ss.delete("attendance.delete", a_idx);
		ss.close();
		return vo;
		
	}
	
	
	
	
}
