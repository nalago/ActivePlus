package com.kh.activePlus.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.activePlus.schedule.model.vo.Schedule;

public interface ScheduleService {
	// 특정 날짜 선택
	public List<Schedule> selectSchedule(Map params);
	
	// 일정 추가
	public int insertSchedule(Schedule schd);
	
	// 일정
	public Schedule readSchedule(Map params);
	
	// 수정
	public int updateSchedule(Map params);
	
	// 삭제
	public int deleteSchedule(Map params);
	
}
